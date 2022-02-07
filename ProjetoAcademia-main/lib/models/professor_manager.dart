import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/professor.dart';
import 'package:lojavirtual/models/user.dart';

class ProfessorManager extends ChangeNotifier {
  User user;
  Professor prof;

  List<Professor> listprof = [];

  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(User user) {
    this.user = user;
    listprof.clear();

    _subscription?.cancel();
    if (user != null) {
      _listenToprof();
    }
  }

  void _listenToprof() {
    _subscription = firestore
        .collection('Professor_Dados_ALL')
        .where('online', isEqualTo: true)
        .snapshots()
        .listen((event) {
      listprof.clear();
      for (final doc in event.documents) {
        listprof.add(Professor.fromDocument(doc));
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

  List<Professor> get filteredProducts {
    final List<Professor> filteredProducts = [];

    if (search.isEmpty) {
      filteredProducts.addAll(listprof);
    } else {
      filteredProducts.addAll(listprof
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
