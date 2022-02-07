import 'package:cloud_firestore/cloud_firestore.dart';

final Firestore firestore = Firestore.instance;

class Version {
  Version({
    this.versao_firebase,
  });

  int version;
  String versao_firebase;
  String new_atualizacoes;

  bool bloquear_create_user;
  bool bloquear_create_admin;
  bool bloquear_trocar_cargos;
  bool bloquear_atualizar_cadastro;

  bool bloquear_user_APP;
  bool bloquear_admin_APP;

  bool bloquear_login;

  Version.fromDocument(DocumentSnapshot document) {
    version = document.data['version'] as int;
    //  version_critical = document.data['version_critical'] as int;

    versao_firebase = document.data['versao_firebase'] as String;
    new_atualizacoes = document.data['new_atualizacoes'] as String;
    //////////////////////////////////////////////////////////////

    bloquear_create_user = document.data['bloquear_create_user'] as bool;
    bloquear_create_admin = document.data['bloquear_create_admin'] as bool;
    bloquear_trocar_cargos = document.data['bloquear_trocar_cargos'] as bool;
    bloquear_atualizar_cadastro =
        document.data['bloquear_atualizar_cadastro'] as bool;

    bloquear_user_APP = document.data['bloquear_user_app'] as bool;
    bloquear_admin_APP = document.data['bloquear_admin_app'] as bool;

///////////////////////////////////////////////////////////////////////

    bloquear_login = document.data['bloquear_login'] as bool;
  }
}
