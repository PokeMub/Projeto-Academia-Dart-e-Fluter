import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class Exercicio extends ChangeNotifier {
  Exercicio({
    this.id,
    this.nameCriador,
    this.idCriador,
    this.explicacaocurta,
    this.explicacaolonga,
    this.codigo,
    this.linkYoutube,
    this.objetivo,
    this.nameExercicio,
    this.parteDoCorpo,
    this.nota,
  });

  var uuid = Uuid();

  Exercicio.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    idCriador = document.data['idCriador'] as String;
    nameCriador = document.data['nameCriador'] as String;
    explicacaocurta = document.data['explicacaocurta'] as String;
    explicacaolonga = document.data['explicacaolonga'] as String;
    codigo = document.data['codigo'] as int;
    linkYoutube = document.data['linkYoutube'] as String;
    objetivo = document.data['objetivo'] as String;
    nameExercicio = document.data['nameExercicio'] as String;
    parteDoCorpo = document.data['parteDoCorpo'] as String;
    nota = document.data['nota'] as int;
  }

  final Firestore firestore = Firestore.instance;
  DocumentReference get saveExercicios =>
      firestore.collection('Exercicios_All').document(uuid.v1());

  String id;
  String idCriador; //dados
  String nameCriador;
  //////////////////
  int codigo; //divisao de exercicio
  int nota;
  //////////////////
  String nameExercicio;
  String parteDoCorpo; //dados do exercicio
  String objetivo;
  //////////////////
  String explicacaocurta;
  String explicacaolonga; //explicação do exercicio
  String linkYoutube;

  Future<void> save() async {
    await saveExercicios.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'idCriador': idCriador,
      'nameCriador': nameCriador,
      'codigo': codigo,
      'nameExercicio': nameExercicio,
      'parteDoCorpo': parteDoCorpo,
      'objetivo': objetivo,
      'explicacaocurta': explicacaocurta,
      'explicacaolonga': explicacaolonga,
      'linkYoutube': linkYoutube,
      'nota': nota,
    };
  }

  @override
  String toString() {
    return 'Exercicio{id: $id, idCriador :$idCriador ,nameCriador:$nameCriador, codigo:$codigo, nameExercicio:$nameExercicio, parteDoCorpo:$parteDoCorpo, objetivo:$objetivo, explicacaocurta:$explicacaocurta, explicacaolonga:$explicacaolonga, linkYoutube:$linkYoutube}';
  }
}
