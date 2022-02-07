import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/proposta_professor.dart';
import 'package:lojavirtual/models/user.dart';

class PropostasAcademiaManager extends ChangeNotifier {
  User user;
  PropostaDeTrabalhoProfessor propostas;

  List<PropostaDeTrabalhoProfessor> listadepropostas = [];

  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(User user) {
    this.user = user;
    listadepropostas.clear();

    _subscription?.cancel();
    if (user != null) {
      _listenToprofs();
    }
  }

  void _listenToprofs() {
    _subscription = firestore
        .collection('Propostas_Trabalho_Professor')
        .where('iddonoacademia', isEqualTo: user.id)
        .snapshots()
        .listen((event) {
      listadepropostas.clear();
      for (final doc in event.documents) {
        listadepropostas.add(PropostaDeTrabalhoProfessor.fromDocument(doc));
      }
      // print(listadepropostas);
      notifyListeners();
    });
  }

  String _search = '';

  String get search => _search;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<PropostaDeTrabalhoProfessor> get filteredProducts {
    final List<PropostaDeTrabalhoProfessor> filteredProducts = [];

    if (search.isEmpty) {
      filteredProducts.addAll(listadepropostas);
    } else {
      filteredProducts.addAll(listadepropostas.where((p) => p
          .salarioPropostoAcademia
          .toLowerCase()
          .contains(search.toLowerCase())));
    }

    return filteredProducts;
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
