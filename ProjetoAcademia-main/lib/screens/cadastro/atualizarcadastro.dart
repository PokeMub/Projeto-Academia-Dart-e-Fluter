import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/models/academia.dart';
import 'package:lojavirtual/models/user.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class AtualizarCadastro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AtualizarCadastros();
  }
}

UserAcademia user;

String sex;
String sangu;

class AtualizarCadastros extends State<AtualizarCadastro> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final User user = User();

  var _sangues = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
    'Selecione seu Tipo Sanguinio'
  ];
  var sangueSelected = 'Selecione seu Tipo Sanguinio';

  var _sexos = ['Masculino', 'Feminino', 'Outros', 'Selecione seu Sexo'];
  var sexoSelected = 'Selecione seu Sexo';

  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    double tamanho = MediaQuery.of(context).size.height * 0.04;

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Atualizar Cadastro'),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey,
                child: Consumer<UserManager>(builder: (_, userManager, __) {
                  userManager.versionprocurar(onFail: (e) {}, onSuccess: () {});
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: <Widget>[
                      //   if (userManager.user.cpf == null) ...[
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter(),
                        ],
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Digite seu CPF'),
                        enabled: !userManager.loading,
                        validator: (cpf) {
                          if (cpf.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (cpf) => user.cpf = cpf,
                      ),
                      SizedBox(height: tamanho),
                      // ],
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.phone_enabled,
                            color: Colors.white,
                          ),
                          hintText: 'Digite seu Telefone',
                        ),
                        enabled: !userManager.loading,
                        validator: (telefone) {
                          if (telefone.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (telefone) => user.telefone = telefone,
                      ),
                      /////////////////////////////////////////////////////////////////////////////////////////////
                      SizedBox(height: tamanho),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.bloodtype,
                            color: Colors.white,
                          ),
                          SizedBox(width: 17.0),
                          DropdownButton(
                            items: _sangues
                                .map((value) => DropdownMenuItem(
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (selectedAccountType) {
                              sangu = selectedAccountType;

                              setState(() {
                                sangueSelected = selectedAccountType;
                              });
                            },
                            value: sangueSelected,
                            isExpanded: false,
                            //   onSaved: (sangueSelected) =>user.tiposanguinio = sangueSelected,
                          )
                        ],
                      ),
                      SizedBox(height: tamanho),
/////////////////////////////////////////////////////////////////////////////////////////////
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CepInputFormatter(),
                        ],
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(Icons.apartment, color: Colors.white),
                            hintText: 'Digite seu CEP'),
                        enabled: !userManager.loading,
                        validator: (cep) {
                          if (cep.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (cep) => user.cep = cep,
                      ),
                      SizedBox(height: tamanho),
                      /////////////////////////////////////////////////////////////////////////////////////////////
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.face_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 17.0),
                          DropdownButton(
                            items: _sexos
                                .map((value) => DropdownMenuItem(
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (selectedAccountType) {
                              //  onSaved: (sexo) => user.sexo = sexo,
                              sex = selectedAccountType;

                              setState(() {
                                sexoSelected = selectedAccountType;
                              });
                            },
                            value: sexoSelected,
                            isExpanded: false,
                            // onSaved: (sexoSelected) => user.sexo = sexoSelected,
                          )
                        ],
                      ),
                      SizedBox(height: tamanho),
                      /////////////////////////////////////////////////////////////////////////////////////////////
                      TextFormField(
                        inputFormatters: [
                          // obrigatório
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter(),
                        ],
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(Icons.cake, color: Colors.white),
                            hintText: 'Digite sua Data de Nascimento'),
                        enabled: !userManager.loading,
                        validator: (datadenascimento) {
                          if (datadenascimento.isEmpty)
                            return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (datadenascimento) =>
                            user.datadenascimento = datadenascimento,
                      ),

//88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

                      SizedBox(height: tamanho),
                      SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          textColor: Colors.white,
                          onPressed: userManager.loading
                              ? null
                              : () async {
                                  if (formKey.currentState.validate()) {
                                    if (userManager.version
                                            .bloquear_atualizar_cadastro ==
                                        true) {
                                      scaffoldKey.currentState
                                          // ignore: deprecated_member_use
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'A Atualização de Cadastro Foi Desabilitada pelo Administrador.\nTente Novamente Mais Tarde.'),
                                        backgroundColor: Colors.red,
                                      ));
                                    } else {
                                      formKey.currentState.save();

                                      user.sexo = sex;
                                      user.tiposanguinio = sangu;
                                      user.id = userManager.user.id;
                                      user.name = userManager.user.name;
                                      user.email = userManager.user.email;
                                      user.money = '0';

                                      userManager.autualizardata(
                                          user: user,
                                          onSuccess: () {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Dados Atualizados com Successo');
                                            Navigator.of(context)
                                                .pushNamed('/base');
                                            //  Navigator.of(context).pop();
                                          },
                                          onFail: (e) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Falha ao Atualizar Dados !!!');
                                          });
                                    }
                                  }
                                },
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text(
                                  'Atualizar Cadastro',
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
