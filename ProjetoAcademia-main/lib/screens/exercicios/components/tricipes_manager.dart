import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/exercicio.dart';
import 'package:lojavirtual/models/user.dart';

class TricipesManager extends ChangeNotifier {
  User user;
  Exercicio exercicios;

  List<Exercicio> listadeExercicios = [];

  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(User user) {
    this.user = user;
    listadeExercicios.clear();

    _subscription?.cancel();
    if (user != null) {
      _listenToPeitoral();
    }
  }

  void _listenToPeitoral() {
    _subscription = firestore
        .collection('Exercicios_All')
        .where('codigo', isEqualTo: 3)
        .snapshots()
        .listen((event) {
      listadeExercicios.clear();
      for (final doc in event.documents) {
        listadeExercicios.add(Exercicio.fromDocument(doc));
      }
      // print(listadeExercicios);
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
      filteredProducts.addAll(listadeExercicios);
    } else {
      filteredProducts.addAll(listadeExercicios.where(
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
