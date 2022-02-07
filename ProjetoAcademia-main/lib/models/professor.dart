import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Professor {
  Professor({
    this.id,
    this.sexo,
    this.idade,
    this.cref,
    this.telefone,
    this.descricao,
    this.estado,
    this.cidade,
    this.instagram,
    this.name,
    this.descricaoum,
    this.descricaodois,
    this.descricaotres,
    this.valorum,
    this.valordois,
    this.valortres,
    this.horariodisponivel,
    this.diasdasemanadisponivel,
    this.mediasalarial,
    this.online, // bool
    this.userid,
    this.nota,
  });

  var uuid = Uuid();

  Professor.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    sexo = document.data['sexo'] as String;
    idade = document.data['idade'] as String;
    cref = document.data['cref'] as String;
    telefone = document.data['telefone'] as String;
    descricao = document.data['descricao'] as String;
    estado = document.data['estado'] as String;
    cidade = document.data['cidade'] as String;
    instagram = document.data['instagram'] as String;
    name = document.data['name'] as String;
    valorum = document.data['valorum'] as String;
    valordois = document.data['valordois'] as String;
    valortres = document.data['valortres'] as String;
    horariodisponivel = document.data['horariodisponivel'] as String;
    diasdasemanadisponivel = document.data['diasdasemanadisponivel'] as String;
    mediasalarial = document.data['mediasalarial'] as String;
    online = document.data['online'] as bool;
    descricaoum = document.data['descricaoum'] as String;
    descricaodois = document.data['descricaodois'] as String;
    descricaotres = document.data['descricaotres'] as String;
    userid = document.data['userid'] as String;
    nota = document.data['nota'] as int;
  }

  final Firestore firestore = Firestore.instance;

///////////////////////////////
  int nota;
  String id;
  String sexo;
  String idade;
  String cref;
  String telefone;
  String descricao;
  String estado;
  String cidade;
  String instagram;
  String name;

  String valorum;
  String valordois;
  String valortres;

  String horariodisponivel;
  String diasdasemanadisponivel;
  String mediasalarial;
  bool online;
  String descricaoum;
  String descricaodois;
  String descricaotres;
  String userid;

  DocumentReference get firestoreRefs =>
      firestore.collection('Professor_Dados_ALL').document(uuid.v1());

  DocumentReference get firestoreRefss =>
      firestore.collection('Professor_Dados_ALL').document(userid);

  Future<void> save() async {
    await firestoreRefss.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sexo': sexo,
      'idade': idade,
      'cref': cref,
      'telefone': telefone,
      'descricao': descricao,
      'estado': estado,
      'cidade': cidade,
      'instagram': instagram,
      'valorum': valorum,
      'valordois': valordois,
      'valortres': valortres,
      'horariodisponivel': horariodisponivel,
      'diasdasemanadisponivel': diasdasemanadisponivel,
      'mediasalarial': mediasalarial,
      'online': online,
      'descricaoum': descricaoum,
      'descricaodois': descricaodois,
      'descricaotres': descricaotres,
      'userid': userid,
      'nota': nota,
    };
  }

  @override
  String toString() {
    return 'Professor{firestore: $firestore, id:$id, user:$userid}';
    // return 'Professor{firestore: $firestore, id:$id,\n   name:$name ,\n  sexo:$sexo ,\n idade:$idade ,\n cref:$cref ,\n telefone:$telefone ,\n descricao:$descricao ,\n estado:$estado ,\n cidade:$cidade ,\n instagram:$instagram ,\n valorum:$valorum ,\n    valordois:$valordois ,\n    valortres:$valortres ,\n  horariodisponivel:$horariodisponivel ,\n diasdasemanadisponivel:$diasdasemanadisponivel ,\n      mediasalarial:$mediasalarial ,\n online:$online,\n  descricaoum:$descricaoum ,\n   descricaodois:$descricaodois ,\n  descricaotres:$descricaotres ,\n , userid:$userid ,\n }';
  }
}
