import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class Treinos extends ChangeNotifier {
  Treinos({
    this.id,
    this.idAluno,
    this.idCriadordoTreino,
    this.nomedotreino,
    this.dias,
    this.tipodotreino,
    this.finalidadedotreino,
    this.repeticao,
    this.iddoexercicio,
  });

  var uuid = Uuid();

  Treinos.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    idAluno = document.data['idAluno'] as String;
    idCriadordoTreino = document.data['idCriadordoTreino'] as String;
    nomedotreino = document.data['nomedotreino'] as String;
    dias = document.data['dias'] as String;
    tipodotreino = document.data['tipodotreino'] as String;
    finalidadedotreino = document.data['finalidadedotreino'] as String;
    repeticao = document.data['repeticao'] as String;
    iddoexercicio = document.data['iddoexercicio'] as String;

    codigo = document.data['codigo'] as int;
    excurta = document.data['excurta'] as String;
    exlonga = document.data['exlonga'] as String;
    linkyoutube = document.data['linkyoutube'] as String;
    nomeexercicio = document.data['nomeexercicio'] as String;
    objetivo = document.data['objetivo'] as String;
    partedocorpo = document.data['partedocorpo'] as String;
  }

  final Firestore firestore = Firestore.instance;
  DocumentReference get saveExercicios =>
      firestore.collection('Exercicios_All_Treinos').document(uuid.v1());

  String id;
  String idAluno;
  String idCriadordoTreino;
  String nomedotreino;
  String dias;
  String tipodotreino;
  String finalidadedotreino;
  String repeticao;
  String iddoexercicio;

  int codigo;
  String excurta, exlonga, linkyoutube, objetivo, nomeexercicio, partedocorpo;

  Future<void> save() async {
    await saveExercicios.setData(toMap());
  }

  Future<void> saves() async {
    await saveExercicios.updateData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'idAluno': idAluno,
      'idCriadordoTreino': idCriadordoTreino,
      'nomedotreino': nomedotreino,
      'dias': dias,
      'tipodotreino': tipodotreino,
      'finalidadedotreino': finalidadedotreino,
      'repeticao': repeticao,
      'iddoexercicio': iddoexercicio,
      'excurta': excurta,
      'exlonga': exlonga,
      'linkyoutube': linkyoutube,
      'objetivo': objetivo,
      'nomeexercicio': nomeexercicio,
      'partedocorpo': partedocorpo,
    };
  }

  @override
  String toString() {
    return 'Treinos{id: $id, idAluno:$idAluno ,idCriadordoTreino : $idCriadordoTreino , nomedotreino: $nomedotreino ,dias: $dias ,tipodotreino: $tipodotreino ,finalidadedotreino: $finalidadedotreino ,repeticao: $repeticao ,iddoexercicio: $iddoexercicio }';
  }
}
