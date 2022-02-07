import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class Alterarcargo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Alterarcargos();
  }
}

String cargo;
String enviar;

var _cargos = [
  ' Dono de Academia',
  ' Instrutor (Professor/Personal)',
  ' Universitarios',
  ' Retirar todos os Cargos',
  ' Selecione seu Cargo'
];
// ignore: non_constant_identifier_names
var CargoSelecionado = ' Selecione seu Cargo';

class Alterarcargos extends State<Alterarcargo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    double sizeboxs = 10;
    return Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Alterar Cargo ...'),
        ),
        body: Consumer<UserManager>(builder: (_, userManager, __) {
          userManager.versionprocurar(onFail: (e) {}, onSuccess: () {});
          return SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey,
                child: Consumer<UserManager>(builder: (_, userManager, __) {
                  return Center(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      shrinkWrap: true,
                      children: <Widget>[
                        Center(),
                        SizedBox(height: sizeboxs * 4),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.folder,
                              color: Colors.white,
                            ),
                            SizedBox(height: sizeboxs * 3),
                            DropdownButton(
                              items: _cargos
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (selectedAccountType) {
                                cargo = selectedAccountType;

                                setState(() {
                                  CargoSelecionado = selectedAccountType;
                                });
                              },
                              value: CargoSelecionado,
                              isExpanded: false,
                            ),
                          ],
                        ),
                        SizedBox(height: sizeboxs * 3),
                        /////////////////////////////////////////////////////////////////////////////////////////////
                        Row(
                          children: <Widget>[
                            Text(
                              'Admin : ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (userManager.adminEnabled) ...{
                              Text(
                                'ATIVADO',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            } else
                              Text(
                                'DESATIVADO',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: sizeboxs * 2),
                        Row(
                          children: <Widget>[
                            Text(
                              'Dono de Academia : ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (userManager.donodeAcademiaEnabled) ...{
                              Text(
                                'ATIVADO',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            } else
                              Text(
                                'DESATIVADO',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: sizeboxs * 2),
                        Row(
                          children: <Widget>[
                            Text(
                              'Personal e Professor : ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (userManager.personalProfessorEnabled) ...{
                              Text(
                                'ATIVADO',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            } else
                              Text(
                                'DESATIVADO',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: sizeboxs * 2),
                        Row(
                          children: <Widget>[
                            Text(
                              'Universitario : ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (userManager.universitarioEnabled) ...{
                              Text(
                                'ATIVADO',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            } else
                              Text(
                                'DESATIVADO',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: sizeboxs * 3),
                        /////////////////////////////////////////////////////////////////////////////////////////////
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
                                : () {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                      if (userManager
                                              .version.bloquear_trocar_cargos ==
                                          true) {
                                        scaffoldKey.currentState
                                            // ignore: deprecated_member_use
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'A Troca de Cargos Foi Desabilitada pelo Administrador.\nTente Novamente Mais Tarde.'),
                                          backgroundColor: Colors.red,
                                        ));
                                      } else if (userManager
                                              .version.bloquear_trocar_cargos ==
                                          false) {
                                        if (cargo == ' Dono de Academia') {
                                          userManager.autualizarcargodata(
                                              trocardecargo: cargo,
                                              onSuccess: () {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Cargo Atualizado Com Sucesso.');
                                              },
                                              onFail: (e) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Falha ao Trocar Cargo !!!');
                                              });
                                        } else if (cargo ==
                                            ' Instrutor (Professor/Personal)') {
                                          userManager.autualizarcargodata(
                                              trocardecargo: cargo,
                                              onSuccess: () {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Cargo Atualizado Com Sucesso.');
                                              },
                                              onFail: (e) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Falha ao Trocar Cargo !!!');
                                              });
                                        } else if (cargo == ' Universitarios') {
                                          userManager.autualizarcargodata(
                                              trocardecargo: cargo,
                                              onSuccess: () {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Cargo Atualizado Com Sucesso.');
                                              },
                                              onFail: (e) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Falha ao Trocar Cargo !!!');
                                              });
                                        } else if (cargo ==
                                            ' Retirar todos os Cargos') {
                                          userManager.autualizarcargodata(
                                              trocardecargo: cargo,
                                              onSuccess: () {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Cargo Atualizado Com Sucesso.');
                                              },
                                              onFail: (e) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Falha ao Trocar Cargo !!!');
                                              });
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: 'Nenhum Cargo Atribuido.');
                                        }
                                      }
                                    }
                                  },
                            child: userManager.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text(
                                    'Atualizar Cargo',
                                    style: TextStyle(fontSize: 18),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        }));
  }
}
