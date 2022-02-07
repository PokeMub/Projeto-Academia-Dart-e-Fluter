import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/models/user.dart';
import 'dados_alunos.dart';

class AlunosDadosManager extends ChangeNotifier {
  User user;
  ColetadeDadosdoAluno dadosaluno;

  List<ColetadeDadosdoAluno> alunosdados = [];

  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(User user) {
    this.user = user;
    alunosdados.clear();

    _subscription?.cancel();
    if (user != null) {
      _listenToAlunos();
    }
  }

  void _listenToAlunos() {
    _subscription = firestore
        .collection('Dados_Biometrico_Aluno')
        .where('idaluno', isEqualTo: user.id)
        .snapshots()
        .listen((event) {
      alunosdados.clear();
      for (final doc in event.documents) {
        alunosdados.add(ColetadeDadosdoAluno.fromDocument(doc));
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
