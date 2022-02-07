import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class PropostaDeTrabalhoProfessor extends ChangeNotifier {
  PropostaDeTrabalhoProfessor({
    this.id,
    this.propostaconcluidaprofessor, // bool
    this.propostaconcluidaAcademia, // bool
    this.online, //bool

    this.idprofessor,
    this.iddonoacademia,
    this.descricaodotrabalho,
    this.diasdasemana,
    this.horadetrabalho,
    this.salarioPropostoAcademia,
    this.salarioPropostoProfessor,
    this.nameAcademy,
    this.cepAcademy,
  });

  var uuid = Uuid();

  PropostaDeTrabalhoProfessor.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    propostaconcluidaprofessor =
        document.data['propostaconcluidaprofessor'] as bool;
    propostaconcluidaAcademia =
        document.data['propostaconcluidaAcademia'] as bool;
    idprofessor = document.data['idprofessor'] as String;
    iddonoacademia = document.data['iddonoacademia'] as String;
    descricaodotrabalho = document.data['descricaodotrabalho'] as String;
    diasdasemana = document.data['diasdasemana'] as String;
    horadetrabalho = document.data['horadetrabalho'] as String;
    salarioPropostoAcademia =
        document.data['salarioPropostoAcademia'] as String;
    salarioPropostoProfessor =
        document.data['salarioPropostoProfessor'] as String;
    online = document.data['online'] as bool;
    nameAcademy = document.data['nameAcademy'] as String;
    cepAcademy = document.data['cepAcademy'] as String;
  }

  final Firestore firestore = Firestore.instance;

///////////////////////////////
  ///

  String id;
  bool propostaconcluidaprofessor;
  bool propostaconcluidaAcademia;
  String idprofessor;
  String iddonoacademia;
  String descricaodotrabalho;
  String diasdasemana;
  String horadetrabalho;
  String salarioPropostoAcademia;
  String salarioPropostoProfessor;
  bool online;
  String nameAcademy;
  String cepAcademy;

  DocumentReference get firestoreRefs =>
      firestore.collection('Propostas_Trabalho_Professor').document(uuid.v1());
  DocumentReference get firestoreRefss =>
      firestore.collection('Propostas_Trabalho_Professor').document(id);

  Future<void> save() async {
    await firestoreRefs.setData(toMap());
  }

  Future<void> updatedata() async {
    await firestoreRefss.updateData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'propostaconcluidaprofessor': propostaconcluidaprofessor,
      'propostaconcluidaAcademia': propostaconcluidaAcademia,
      'idprofessor': idprofessor,
      'iddonoacademia': iddonoacademia,
      'descricaodotrabalho': descricaodotrabalho,
      'diasdasemana': diasdasemana,
      'horadetrabalho': horadetrabalho,
      'salarioPropostoAcademia': salarioPropostoAcademia,
      'salarioPropostoProfessor': salarioPropostoProfessor,
      'online': online,
      'nameAcademy': nameAcademy,
      'cepAcademy': cepAcademy,
    };
  }

  @override
  String toString() {
    return 'Professor{firestore: $firestore, id:$id,\n propostaconcluidaprofessor:$propostaconcluidaprofessor ,\n  propostaconcluidaAcademia:$propostaconcluidaAcademia ,\n  idprofessor:$idprofessor ,\n  iddonoacademia:$iddonoacademia ,\n descricaodotrabalho:$descricaodotrabalho ,\n  diasdasemana:$diasdasemana ,\n horadetrabalho:$horadetrabalho ,\n salarioPropostoAcademia:$salarioPropostoAcademia ,\n salarioPropostoProfessor:$salarioPropostoProfessor ,\n  online:$online ,\n    nameAcademy:$nameAcademy ,\n   cepAcademy:$cepAcademy ,\n}';
    // return 'Professor{firestore: $firestore, id:$id,\n   name:$name ,\n  sexo:$sexo ,\n idade:$idade ,\n cref:$cref ,\n telefone:$telefone ,\n descricao:$descricao ,\n estado:$estado ,\n cidade:$cidade ,\n instagram:$instagram ,\n valorum:$valorum ,\n    valordois:$valordois ,\n    valortres:$valortres ,\n  horariodisponivel:$horariodisponivel ,\n diasdasemanadisponivel:$diasdasemanadisponivel ,\n      mediasalarial:$mediasalarial ,\n online:$online,\n  descricaoum:$descricaoum ,\n   descricaodois:$descricaodois ,\n  descricaotres:$descricaotres ,\n , userid:$userid ,\n }';
  }
}
