import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/treinos.dart';
import 'package:lojavirtual/models/user.dart';

class TreinoManager extends ChangeNotifier {
  User user;
  Treinos treinos;

  List<Treinos> listadeTreinos = [];

  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(User user) {
    this.user = user;
    listadeTreinos.clear();

    _subscription?.cancel();
    if (user != null) {
      _listenTotreinos();
    }
  }

  void _listenTotreinos() {
    _subscription = firestore
        .collection('Exercicios_All_Treinos')
        .where('idAluno', isEqualTo: user.id)
        .snapshots()
        .listen((event) {
      listadeTreinos.clear();
      for (final doc in event.documents) {
        listadeTreinos.add(Treinos.fromDocument(doc));
      }
      //print(listadeTreinos);
      notifyListeners();
    });
  }

  String _search = '';

  String get search => _search;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Treinos> get filteredProducts {
    final List<Treinos> filteredProducts = [];

    if (search.isEmpty) {
      filteredProducts.addAll(listadeTreinos);
    } else {
      filteredProducts.addAll(listadeTreinos.where(
          (p) => p.nomedotreino.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredProducts;
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
