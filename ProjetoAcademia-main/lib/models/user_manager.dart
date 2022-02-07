import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/helpers/firebase_errors.dart';
import 'package:lojavirtual/models/academia.dart';
import 'package:lojavirtual/models/alunos.dart';
import 'package:lojavirtual/models/product.dart';
import 'package:lojavirtual/models/professor_funcionario.dart';
import 'package:lojavirtual/models/proposta_professor.dart';
import 'package:lojavirtual/models/user.dart';
import 'package:lojavirtual/models/version.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;

  User user;
  UserAcademia userdaacademia;
  Alunos aluno;
  Product produto, minhaAcademia;
  Version version;
  ProfessorFuncionario funcionario;

  String idfuncionario;

  String link =
      'https://www.lsensino.com.br/wp-content/uploads/2019/10/banner-desktop-fundo-preto.png';

  bool _loading = false;
  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  BuildContext get context => null;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      await _loadCurrentUser(firebaseUser: result.user);

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  Future<void> signUp({User user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      user.id = result.user.uid;
      this.user = user;

      await user.saveData();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  Future<void> autualizardata(
      {User user, Function onFail, Function onSuccess}) async {
    try {
      this.user = user;
      await user.saveData();
      _loadCurrentUser();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> moneydata(
      {String money, Function onFail, Function onSuccess}) async {
    try {
      await firestore
          .collection('users')
          .document(user.id)
          .updateData({'money': money});

      _loadCurrentUser();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> notaAcademia({int notaenviar, String id}) async {
    try {
      print('Nota Escolhida: ');
      print(notaenviar);
      print('\nID Escolhido: ');
      print(id);

      DocumentSnapshot doc =
          await Firestore.instance.collection('academias').document(id).get();

      int nota;
      double vin;

      nota = doc.data['nota'];

      print('\nNota Do Exercicio no Banco: ');
      print(nota);

      /////////////////////////////////////////////
      int a;
      if (nota == 0) {
        a = notaenviar.truncate();
      } else {
        vin = (nota + notaenviar) / 2;
        if (vin > 5) {
          vin = 5;
        }
        print('\nCalculo da Nota: ');
        print(vin);
        a = vin.toInt();
      }

      print('\nNota Salva no Banco: ');
      print(a);

      await firestore
          .collection('academias')
          .document(id)
          .updateData({'nota': a});

      // ignore: unused_catch_clause
    } on PlatformException catch (e) {}
  }

  Future<void> notaFuncionario({int notaenviar, String id}) async {
    try {
      print('Nota Escolhida: ');
      print(notaenviar);
      print('\nID Escolhido: ');
      print(id);

      DocumentSnapshot doc = await Firestore.instance
          .collection('Professor_Dados_ALL')
          .document(id)
          .get();

      int nota;
      double vin;

      nota = doc.data['nota'];

      print('\nNota Do Exercicio no Banco: ');
      print(nota);

      /////////////////////////////////////////////
      int a;
      if (nota == 0) {
        a = notaenviar.truncate();
      } else {
        vin = (nota + notaenviar) / 2;
        if (vin > 5) {
          vin = 5;
        }
        print('\nCalculo da Nota: ');
        print(vin);
        a = vin.toInt();
      }

      print('\nNota Salva no Banco: ');
      print(a);

      await firestore
          .collection('Professor_Dados_ALL')
          .document(id)
          .updateData({'nota': a});

      // ignore: unused_catch_clause
    } on PlatformException catch (e) {}
  }

  Future<void> notaexercicio({int notaenviar, String id}) async {
    try {
      print('Nota Escolhida: ');
      print(notaenviar);
      print('\nID Escolhido: ');
      print(id);

      DocumentSnapshot doc = await Firestore.instance
          .collection('Exercicios_All')
          .document(id)
          .get();

      int nota;
      double vin;

      nota = doc.data['nota'];

      print('\nNota Do Exercicio no Banco: ');
      print(nota);

      /////////////////////////////////////////////
      int a;
      if (nota == 0) {
        a = notaenviar.truncate();
      } else {
        vin = (nota + notaenviar) / 2;
        if (vin > 5) {
          vin = 5;
        }
        print('\nCalculo da Nota: ');
        print(vin);
        a = vin.toInt();
      }

      print('\nNota Salva no Banco: ');
      print(a);

      await firestore
          .collection('Exercicios_All')
          .document(id)
          .updateData({'nota': a});

      // ignore: unused_catch_clause
    } on PlatformException catch (e) {}
  }

  Future<void> criarpropostaacademiaprofessor(
      PropostaDeTrabalhoProfessor proposta, String id) async {
    try {
      DocumentSnapshot doc =
          await Firestore.instance.collection('academias').document(id).get();

      proposta.nameAcademy = doc.data['nameAcademy'];
      proposta.cepAcademy = doc.data['cepAcademy'];
      proposta.online = true;

      proposta.save();
      // ignore: unused_catch_clause
    } on PlatformException catch (e) {}
  }

  Future<void> moneycomprardata(
      {String money,
      String pagamento,
      String idreceber,
      Function onFail,
      Function onSuccess}) async {
    var onePointOne = double.parse(money);
    var onePointtwo = double.parse(pagamento);

    double resultado;
    String enviar;

    String moneyreceber;
    String enviarmoney;

    resultado = onePointOne - onePointtwo;
    enviar = resultado.toString();

    print(
        'Aluno :$money = $onePointOne, Academia : $pagamento = $onePointtwo, Resultado : $resultado, Enviar : $enviar');

    try {
      await firestore
          .collection('users')
          .document(user.id)
          .updateData({'money': enviar});

      DocumentSnapshot doc = await Firestore.instance
          .collection('users')
          .document(idreceber)
          .get();

      moneyreceber = doc.data['money'];
      print(moneyreceber);

      var moneyreceberdouble = double.parse(moneyreceber);

      moneyreceberdouble = moneyreceberdouble + onePointtwo;
      enviarmoney = moneyreceberdouble.toString();

      await firestore
          .collection('users')
          .document(idreceber)
          .updateData({'money': enviarmoney});
      print(enviarmoney);

      await _loadCurrentUser();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> autualizarcargodata(
      {String trocardecargo, Function onFail, Function onSuccess}) async {
    try {
      if (trocardecargo == ' Dono de Academia') {
        await firestore
            .collection('donodeacademia')
            .document(user.id)
            .setData({'user': user.id});
      } else if (trocardecargo == ' Instrutor (Professor/Personal)') {
        await firestore
            .collection('personal.professor')
            .document(user.id)
            .setData({'user': user.id});
      } else if (trocardecargo == ' Universitarios') {
        await firestore
            .collection('universitario')
            .document(user.id)
            .setData({'user': user.id});
      } else if (trocardecargo == ' Retirar todos os Cargos') {
        await firestore.collection('universitario').document(user.id).delete();
        await firestore.collection('donodeacademia').document(user.id).delete();
        await firestore
            .collection('personal.professor')
            .document(user.id)
            .delete();
      } else {}

      _loadCurrentUser();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  void signOut() {
    auth.signOut();
    user = null;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) async {
    final FirebaseUser currentUser = firebaseUser ?? await auth.currentUser();
    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').document(currentUser.uid).get();
      user = User.fromDocument(docUser);

      final DocumentSnapshot docAcademia = await firestore
          .collection('academias')
          .document(currentUser.uid)
          .get();
      //minhaAcademia = Product.fromDocument(docAcademia);

      if (docAcademia.exists) {
        minhaAcademia = Product.fromDocument(docAcademia);
      }

      final docAdmin =
          await firestore.collection('admins').document(user.id).get();
      final docDonodeAcademia =
          await firestore.collection('donodeacademia').document(user.id).get();
      final docPersonalProfessor = await firestore
          .collection('personal.professor')
          .document(user.id)
          .get();
      final docUniversitario =
          await firestore.collection('universitario').document(user.id).get();

      final docacademic =
          await firestore.collection('academias').document(user.id).get();

      if (docacademic.exists) {
        user.academic = true;
      }

      if (docAdmin.exists) {
        user.admin = true;
      }
      if (docDonodeAcademia.exists) {
        user.donodeAcademia = true;
      }
      if (docPersonalProfessor.exists) {
        user.personalProfessor = true;
      }
      if (docUniversitario.exists) {
        user.universitario = true;
      }

      notifyListeners();
    }
  }

////////////////////////////////////////////////////////////////////////////////

  Future<void> createAcademy(
      {UserAcademia useracademias, Function onFail, Function onSuccess}) async {
    try {
      this.userdaacademia = useracademias;
      userdaacademia.id = user.id;
      userdaacademia.nameCriadorAcademy = user.name;

      await useracademias.saveDataAcademy();

      final equipmentCollection =
          Firestore.instance.collection('academias').document(user.id);

      equipmentCollection.updateData({
        "imagens": FieldValue.arrayUnion([link])
      });

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

//importante
  Future<void> criarimagemacademia(
      {Function onFail, Function onSuccess}) async {
    try {
      final equipmentCollection =
          Firestore.instance.collection('academias').document(user.id);

      equipmentCollection.updateData({
        "imagens": FieldValue.arrayUnion([link])
      });

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> excluirexercicio(
      {String id, Function onFail, Function onSuccess}) async {
    try {
      await firestore.collection('Exercicios_All').document(id).delete();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> addalunos(
      {String idaluno,
      String idacademia,
      Function onFail,
      Function onSuccess}) async {
    try {
      aluno.id = user.id;
      aluno.idaluno = user.id;
      aluno.idacademia = idacademia;
      aluno.plano = 'Plano 1';

      print(
          '${aluno.id}===${aluno.idaluno}===${aluno.idacademia}===${aluno.plano}');
/*
      final equipmentCollection =
          Firestore.instance.collection('academias').document(idacademia);

      equipmentCollection.updateData({
        "alunos": FieldValue.arrayUnion([idaluno])
      });
*/
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> atualizardataAcademy(
      {UserAcademia useracademias, Function onFail, Function onSuccess}) async {
    try {
      this.userdaacademia = useracademias;
      userdaacademia.id = user.id;
      userdaacademia.nameCriadorAcademy = user.name;

      await useracademias.updateDataAcademy();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

////////////////////////////////////////////////////////////////////////////////
  Future<void> loadVersion() async {
    final DocumentSnapshot versions =
        await firestore.collection('version').document('version').get();
    version = Version.fromDocument(versions);

    notifyListeners();
  }

  Future<void> versionprocurar({Function onFail, Function onSuccess}) async {
    try {
      await loadVersion();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  bool get adminEnabled => user != null && user.admin;
  bool get donodeAcademiaEnabled => user != null && user.donodeAcademia;
  bool get personalProfessorEnabled => user != null && user.personalProfessor;
  bool get universitarioEnabled => user != null && user.universitario;
  bool get academicEnabled => user != null && user.academic;
}
