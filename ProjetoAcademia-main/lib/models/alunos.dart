import 'package:cloud_firestore/cloud_firestore.dart';

class Alunos {
  Alunos({
    this.id,
    this.idaluno,
    this.idacademia,
    this.plano,
    this.valordoplano,
    this.name,
    this.genero,
    this.idade,
    this.tiposanguinio,
    this.date,
  });

  Alunos.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document.data['name'] as String;
    idaluno = document.data['idaluno'] as String;
    idacademia = document.data['idacademia'] as String;
    plano = document.data['plano'] as String;
    valordoplano = document.data['valordoplano'] as String;
    date = document.data['date'] as Timestamp;

    tiposanguinio = document.data['tiposanguinio'] as String;
    idade = document.data['idade'] as String;
    genero = document.data['genero'] as String;
  }

  final Firestore firestore = Firestore.instance;

  String id;
  String name;
  String idaluno;
  String idacademia;
  String plano;
  String valordoplano;
  String tiposanguinio;
  String idade;
  String genero;

  Timestamp date;

  // DocumentReference get firestoreRef => firestore.collection('alunos').document('4XSxbJk8inW4m7ZUOWQxDv1eCfC2');
  DocumentReference get firestoreRef =>
      firestore.collection('alunos').document(id);

  DocumentReference get firestoreRefs =>
      firestore.collection('alunos').document(idaluno);

  Future<void> save() async {
    await firestoreRefs.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'idacademia': idacademia,
      'idaluno': idaluno,
      'plano': plano,
      'name': name,
      'date': Timestamp.now(),
      'valordoplano': valordoplano,
      'tiposanguinio': tiposanguinio,
      'idade': idade,
      'genero': genero,
    };
  }

/*
    firestore.collection('alunos').document(id).setData({
      'idacademia': idacademia,
      'idaluno': idaluno,
      'plano': plano,
      //  'date': Timestamp.now(),
    });*/

  // Timestamp date;

  @override
  String toString() {
    return 'Alunos{firestore: $firestore, id:$id, idacademia :$idacademia, idaluno:$idaluno,name :$name, plano : $plano, date: $date, valordoplano :$valordoplano}';
  }
}
