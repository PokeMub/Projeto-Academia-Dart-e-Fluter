import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/professor_funcionario.dart';
import 'package:lojavirtual/models/user.dart';

class ProfessorFuncionarioManager extends ChangeNotifier {
  User user;
  ProfessorFuncionario professor;

  List<ProfessorFuncionario> professorfuncionarioacademia = [];

  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(User user) {
    this.user = user;
    professorfuncionarioacademia.clear();

    _subscription?.cancel();
    if (user != null) {
      _listenToprof();
    }
  }

  void _listenToprof() {
    _subscription = firestore
        .collection('Academia_Funcionarios_ALL')
        .where('iddonodaacademia', isEqualTo: user.id)
        .snapshots()
        .listen((event) {
      professorfuncionarioacademia.clear();
      for (final doc in event.documents) {
        professorfuncionarioacademia
            .add(ProfessorFuncionario.fromDocument(doc));
      }
      //print(listprof);
      notifyListeners();
    });
  }

  String _search = '';

  String get search => _search;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<ProfessorFuncionario> get filteredProducts {
    final List<ProfessorFuncionario> filteredProducts = [];

    if (search.isEmpty) {
      filteredProducts.addAll(professorfuncionarioacademia);
    } else {
      filteredProducts.addAll(professorfuncionarioacademia
          .where((p) => p.name.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredProducts;
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
