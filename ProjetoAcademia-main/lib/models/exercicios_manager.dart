import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/exercicio.dart';
import 'package:lojavirtual/models/user.dart';

class ExerciciosManager extends ChangeNotifier {
  User user;

  Exercicio exercicioss;

  List<Exercicio> listadeExe = [];

  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(User user) {
    this.user = user;
    listadeExe.clear();

    _subscription?.cancel();
    if (user != null) {
      _listenTotreinos();
    }
  }

  void _listenTotreinos() {
    _subscription =
        firestore.collection('Exercicios_All').snapshots().listen((event) {
      listadeExe.clear();
      for (final doc in event.documents) {
        listadeExe.add(Exercicio.fromDocument(doc));
      }
      //print(listadeExe);
      notifyListeners();
    });
  }

  String _search = '';

  String get search => _search;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Exercicio> get filteredProducts {
    final List<Exercicio> filteredProducts = [];

    if (search.isEmpty) {
      filteredProducts.addAll(listadeExe);
    } else {
      filteredProducts.addAll(listadeExe.where(
          (p) => p.nameExercicio.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredProducts;
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
