import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ColetadeDadosdoAluno {
  ColetadeDadosdoAluno({
    this.id,
    this.idaluno,
    this.idacademia,
    this.name,
    this.date,
    this.peso,
    this.imc,
    this.tricipe,
    this.subscapular,
    this.bicipes,
    this.axilarmedia,
    this.toracica,
    this.suprailiaca,
    this.supraespinal,
    this.coxa,
    this.panturilha,
    this.altura,
  });

  var uuid = Uuid();

  ColetadeDadosdoAluno.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document.data['name'] as String;
    idaluno = document.data['idaluno'] as String;
    idacademia = document.data['idacademia'] as String;
    date = document.data['date'] as Timestamp;
    peso = document.data['peso'] as String;
    imc = document.data['imc'] as String;
    tricipe = document.data['tricipe'] as String;
    subscapular = document.data['subscapular'] as String;
    bicipes = document.data['bicipes'] as String;
    axilarmedia = document.data['axilarmedia'] as String;
    toracica = document.data['toracica'] as String;
    suprailiaca = document.data['suprailiaca'] as String;
    supraespinal = document.data['supraespinal'] as String;
    coxa = document.data['coxa'] as String;
    panturilha = document.data['panturilha'] as String;
    altura = document.data['altura'] as String;
  }

  final Firestore firestore = Firestore.instance;

///////////////////////////////
  String id;
  String name;
  String idaluno;
  String idacademia;
  Timestamp date;
  String peso;
  String imc;
  String tricipe;
  String subscapular;
  String bicipes;
  String axilarmedia;
  String toracica;
  String suprailiaca;
  String supraespinal;
  String coxa;
  String panturilha;
  String altura;

  //////////////////////////

  DocumentReference get firestoreRefs =>
      firestore.collection('Dados_Biometrico_Aluno').document(uuid.v1());

  Future<void> save() async {
    await firestoreRefs.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'idacademia': idacademia,
      'idaluno': idaluno,
      'name': name,
      'date': Timestamp.now(),
      'peso': peso,
      'imc': imc,
      'tricipe': tricipe,
      'subscapular': subscapular,
      'bicipes': bicipes,
      'axilarmedia': axilarmedia,
      'toracica': toracica,
      'suprailiaca': suprailiaca,
      'supraespinal': supraespinal,
      'coxa': coxa,
      'panturilha': panturilha,
      'altura': altura,
    };
  }

  @override
  String toString() {
    return 'ColetadeDadosdoAluno{firestore: $firestore, id:$id, idacademia :$idacademia, idaluno:$idaluno,name :$name,date:$date, peso:$peso, imc:$imc, tricipe:$tricipe, subscapular:$subscapular,  bicipes:$bicipes,  axilarmedia:$axilarmedia, toracica:$toracica, suprailiaca:$suprailiaca,  supraespinal:$supraespinal, coxa:$coxa,  panturilha:$panturilha, altura:$altura,';
  }
}
