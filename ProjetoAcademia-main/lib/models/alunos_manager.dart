import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/helpers/firebase_errors.dart';
import 'package:lojavirtual/models/alunos.dart';
import 'package:lojavirtual/models/product.dart';
import 'package:lojavirtual/models/user.dart';

import 'dados_alunos.dart';

class AlunosManager extends ChangeNotifier {
  User user;
  Alunos aluno;

  ColetadeDadosdoAluno dadosdoaluno;

  List<Alunos> listaalunos = [];

  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(User user) {
    this.user = user;
    listaalunos.clear();

    _subscription?.cancel();
    if (user != null) {
      _listenToAlunos();
    }
  }

  void _listenToAlunos() {
    // _subscription = firestore.collection('orders').document(idacademia).where('user', isEqualTo: user.id).snapshots().listen((event){
    _subscription = firestore
        .collection('alunos')
        .where('idacademia', isEqualTo: user.id)
        .snapshots()
        .listen((event) {
      listaalunos.clear();
      for (final doc in event.documents) {
        listaalunos.add(Alunos.fromDocument(doc));
      }
      //    print(listaalunos);
      notifyListeners();
    });
  }

  Future<void> addalunos(
      {Alunos alun, Function onFail, Function onSuccess}) async {
    try {
      this.aluno = alun;
      await aluno.save();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> salvardadosaluno(
      {ColetadeDadosdoAluno dadosdoalun,
      Function onFail,
      Function onSuccess}) async {
    try {
      this.dadosdoaluno = dadosdoalun;
      await dadosdoaluno.save();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
