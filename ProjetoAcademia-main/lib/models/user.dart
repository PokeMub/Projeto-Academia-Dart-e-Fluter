import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    this.email,
    this.password,
    this.name,
    this.id,
    this.cpf,
    this.telefone,
    this.tiposanguinio,
    this.cep,
    this.sexo,
    this.datadenascimento,
    this.money,
  });

  User.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document.data['name'] as String;
    email = document.data['email'] as String;
    cpf = document.data['cpf'] as String;
    telefone = document.data['telefone'] as String;
    tiposanguinio = document.data['tiposanguinio'] as String;
    cep = document.data['cep'] as String;
    sexo = document.data['genero'] as String;
    datadenascimento = document.data['datadenascimento'] as String;
    money = document.data['money'] as String;
  }

  String id;
  String name;
  String email;
  String password;
  String cpf;
  String telefone;
  String tiposanguinio;
  String cep;
  String sexo; //
  String datadenascimento;
  String confirmPassword;
  String money;

  bool admin = false;
  bool donodeAcademia = false;
  bool personalProfessor = false;
  bool universitario = false;
  bool academic = false;

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');

  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'cpf': cpf,
      'telefone': telefone,
      'tiposanguinio': tiposanguinio,
      'cep': cep,
      'genero': sexo,
      'datadenascimento': datadenascimento,
      'money': money,
    };
  }
}
