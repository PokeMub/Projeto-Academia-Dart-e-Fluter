import 'package:cloud_firestore/cloud_firestore.dart';

final Firestore firestore = Firestore.instance;

class UserAcademia {
  UserAcademia({
    this.id,
    this.nameAcademy,
    this.nameCriadorAcademy,
    this.cepAcademy,
    this.numeroCepAcademy,
    this.telefoneAcademy,
    this.linkInstagramAcademy,
    this.linkYoutubeAcademy,
    this.cNPJAcademy,
    this.notavideosAcademy,
    this.notaAcademy,
    this.bibiografiaAcademy,
    this.intrutorplanoumAcademy,
    this.intrutorplanodoisAcademy,
    this.intrutorplanotresAcademy,
    this.periodoplanotresAcademy,
    this.periodoplanodoisAcademy,
    this.periodoplanoumAcademy,
    this.qtdplanotresAcademy,
    this.qtdplanodoisAcademy,
    this.qtdplanoumAcademy,
    this.planotresvalorAcademy,
    this.planodoisvalorAcademy,
    this.planoumvalorAcademy,
    this.planotresnameAcademy,
    this.planodoisnameAcademy,
    this.planoumnameAcademy,
    this.complementoreferencia,
    this.images,
  });

  String id; //
  String nameAcademy; //
  String nameCriadorAcademy; //
  String cepAcademy;
  String numeroCepAcademy;
  String telefoneAcademy;
  String linkInstagramAcademy;
  String linkYoutubeAcademy;
  String cNPJAcademy;
  String notavideosAcademy;
  String notaAcademy;
  String bibiografiaAcademy;
  ///////////////////////////////////////////
  bool intrutorplanoumAcademy;
  bool intrutorplanodoisAcademy;
  bool intrutorplanotresAcademy;

  String periodoplanotresAcademy;
  String periodoplanodoisAcademy;
  String periodoplanoumAcademy;

  String qtdplanotresAcademy;
  String qtdplanodoisAcademy;
  String qtdplanoumAcademy;

  String planotresvalorAcademy;
  String planodoisvalorAcademy;
  String planoumvalorAcademy;

  String planotresnameAcademy;
  String planodoisnameAcademy;
  String planoumnameAcademy;

  /////////////////////////////////////////
  String complementoreferencia;
  List images;

  UserAcademia.fromDocumentAcademy(DocumentSnapshot document) {
    id = document.documentID;
    nameAcademy = document.data['nameAcademy'] as String;
    nameCriadorAcademy = document.data['nameCriadorAcademy'] as String;
    cepAcademy = document.data['cepAcademy'] as String;
    numeroCepAcademy = document.data['numeroCepAcademy'] as String;
    telefoneAcademy = document.data['telefoneAcademy'] as String;
    linkInstagramAcademy = document.data['linkInstagramAcademy'] as String;
    linkYoutubeAcademy = document.data['linkYoutubeAcademy'] as String;
    cNPJAcademy = document.data['cNPJAcademy'] as String;
    notavideosAcademy = document.data['notavideosAcademy'] as String;
    notaAcademy = document.data['notaAcademy'] as String;
    bibiografiaAcademy = document.data['bibiografiaAcademy'] as String;

    planoumnameAcademy = document.data['planoumnameAcademy'] as String;
    planodoisnameAcademy = document.data['planodoisnameAcademy'] as String;
    planotresnameAcademy = document.data['planotresnameAcademy'] as String;

    planoumvalorAcademy = document.data['planoumvalorAcademy'] as String;
    planodoisvalorAcademy = document.data['planodoisvalorAcademy'] as String;
    planotresvalorAcademy = document.data['planotresvalorAcademy'] as String;

    qtdplanoumAcademy = document.data['qtdplanoumAcademy'] as String;
    qtdplanodoisAcademy = document.data['qtdplanodoisAcademy'] as String;
    qtdplanotresAcademy = document.data['qtdplanotresAcademy'] as String;

    periodoplanoumAcademy = document.data['periodoplanoumAcademy'] as String;
    periodoplanodoisAcademy =
        document.data['periodoplanodoisAcademy'] as String;
    periodoplanotresAcademy =
        document.data['periodoplanotresAcademy'] as String;

    intrutorplanoumAcademy = document.data['intrutorplanoumAcademy'] as bool;
    intrutorplanodoisAcademy =
        document.data['intrutorplanodoisAcademy'] as bool;
    intrutorplanotresAcademy =
        document.data['intrutorplanotresAcademy'] as bool;

    images = List<String>.from(document.data['imagens'] as List<dynamic>);
    // images = document.data['imagens'];
  }

  DocumentReference get firestoreRef =>
      Firestore.instance.document('academias/$id');

  Future<void> saveDataAcademy() async {
    await firestoreRef.setData(toMapAcademy());
  }

  Future<void> updateDataAcademy() async {
    await firestoreRef.updateData(toMapAcademy());
  }

  Map<String, dynamic> toMapAcademy() {
    return {
      'id': id,
      'nameAcademy': nameAcademy,
      'nameCriadorAcademy': nameCriadorAcademy,
      'cepAcademy': cepAcademy,
      'numeroCepAcademy': numeroCepAcademy,
      'telefoneAcademy': telefoneAcademy,
      'linkInstagramAcademy': linkInstagramAcademy,
      'linkYoutubeAcademy ': linkYoutubeAcademy,
      'cNPJAcademy': cNPJAcademy,
      'notavideosAcademy ': notavideosAcademy,
      'notaAcademy': notaAcademy,
      'bibiografiaAcademy': bibiografiaAcademy,
      'planoumnameAcademy': planoumnameAcademy,
      'planodoisnameAcademy': planodoisnameAcademy,
      'planotresnameAcademy': planotresnameAcademy,
      'planoumvalorAcademy': planoumvalorAcademy,
      'planodoisvalorAcademy': planodoisvalorAcademy,
      'planotresvalorAcademy': planotresvalorAcademy,
      'qtdplanoumAcademy': qtdplanoumAcademy,
      'qtdplanodoisAcademy': qtdplanodoisAcademy,
      'qtdplanotresAcademy': qtdplanotresAcademy,
      'periodoplanoumAcademy': periodoplanoumAcademy,
      'periodoplanodoisAcademy': periodoplanodoisAcademy,
      'periodoplanotresAcademy': periodoplanotresAcademy,
      'intrutorplanoumAcademy': intrutorplanoumAcademy,
      'intrutorplanodoisAcademy': intrutorplanodoisAcademy,
      'intrutorplanotresAcademy': intrutorplanotresAcademy,
    };
  }
}
