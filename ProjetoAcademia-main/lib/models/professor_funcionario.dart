import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProfessorFuncionario {
  ProfessorFuncionario({
    this.id,
    this.cref,
    this.telefone,
    this.name,
    this.descricaodotrabalho,
    this.diasdasemana,
    this.horaspordia,
    this.iddonodaacademia,
    this.salario,
  });

  var uuid = Uuid();

  ProfessorFuncionario.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    cref = document.data['cref'] as String;
    telefone = document.data['telefone'] as String;
    name = document.data['name'] as String;
    descricaodotrabalho = document.data['descricaodotrabalho'] as String;
    diasdasemana = document.data['diasdasemana'] as String;
    horaspordia = document.data['horaspordia'] as String;
    iddonodaacademia = document.data['iddonodaacademia'] as String;
    salario = document.data['salario'] as String;
  }

  final Firestore firestore = Firestore.instance;

///////////////////////////////
  String id;
  String cref;
  String telefone;
  String name;

  String descricaodotrabalho;
  String diasdasemana;
  String horaspordia;
  String iddonodaacademia;
  String salario;

  DocumentReference get saveData =>
      firestore.collection('Academia_Funcionarios_ALL').document(id);

  DocumentReference get updateData =>
      firestore.collection('Academia_Funcionarios_ALL').document(id);

  Future<void> save() async {
    await saveData.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cref': cref,
      'telefone': telefone,
      'descricaodotrabalho': descricaodotrabalho,
      'diasdasemana': diasdasemana,
      'horaspordia': horaspordia,
      'iddonodaacademia': iddonodaacademia,
      'salario': salario,
    };
  }

  @override
  String toString() {
    return 'ProfessorFuncionario{firestore: $firestore, id:$id ,\n  descricaodotrabalho:$descricaodotrabalho ,\n   diasdasemana:$diasdasemana ,\n horaspordia:$horaspordia ,\n   iddonodaacademia:$iddonodaacademia ,\n  professorsalario:$salario ,\n}';
    // return 'Professor{firestore: $firestore, id:$id,\n   name:$name ,\n  sexo:$sexo ,\n idade:$idade ,\n cref:$cref ,\n telefone:$telefone ,\n descricao:$descricao ,\n estado:$estado ,\n cidade:$cidade ,\n instagram:$instagram ,\n valorum:$valorum ,\n    valordois:$valordois ,\n    valortres:$valortres ,\n  horariodisponivel:$horariodisponivel ,\n diasdasemanadisponivel:$diasdasemanadisponivel ,\n      mediasalarial:$mediasalarial ,\n online:$online,\n  descricaoum:$descricaoum ,\n   descricaodois:$descricaodois ,\n  descricaotres:$descricaotres ,\n , userid:$userid ,\n }';
  }
}
