import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/exercicio.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class TelaApresetacaoScreen extends StatelessWidget {
  TelaApresetacaoScreen(this.exercicio);

  final Exercicio exercicio;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    //  double tamanho = MediaQuery.of(context).size.height * 0.04;
    final primaryColor = Theme.of(context).primaryColor;

    return ChangeNotifierProvider.value(
      value: exercicio,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(exercicio.nameExercicio),
          centerTitle: true,
          actions: <Widget>[
            Consumer<UserManager>(
              builder: (_, userManager, __) {
                if (userManager.adminEnabled ||
                    (exercicio.idCriador == userManager.user.id)) {
                  return IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      userManager.excluirexercicio(
                          id: exercicio.id,
                          onFail: (e) {
                            // ignore: deprecated_member_use
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Falha ao excluir: $e'),
                              backgroundColor: Colors.red,
                            ));
                          },
                          onSuccess: () {
                            // ignore: deprecated_member_use
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Sucesso ao Excluir'),
                              backgroundColor: Colors.red,
                            ));
                          });
                      Navigator.of(context).pop();

                      // Navigator.of(context).pushReplacementNamed(
                      //   '/edit_product',
                      //  arguments: product);
                    },
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        ' Exercicio : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        exercicio.nameExercicio,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        ' Parte do Corpo : ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        exercicio.parteDoCorpo,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        " Objetivo: ",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: AutoSizeText("${exercicio.objetivo}",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        minFontSize: 18,
                        maxLines: 4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        ' Explicação Curta : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: AutoSizeText('${exercicio.explicacaocurta}',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        minFontSize: 18,
                        maxLines: 5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        ' Explicação Longa : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: AutoSizeText('${exercicio.explicacaolonga}',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        minFontSize: 17,
                        maxLines: 10),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        ' Link (Youtube) : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: AutoSizeText('${exercicio.linkYoutube}',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        minFontSize: 17,
                        maxLines: 3),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Consumer<UserManager>(
                      builder: (_, userManager, __) {
                        return SizedBox(
                          height: 33,

                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () async {
                              userManager.notaexercicio(
                                notaenviar: (1),
                                id: (exercicio.id),
                              );
                            },
                            color: primaryColor,
                            textColor: Colors.white,
                            child: Text('Nota 1',
                                style: const TextStyle(fontSize: 18)),
                          ),
                        );
                      },
                    ),
                    Consumer<UserManager>(
                      builder: (_, userManager, __) {
                        return SizedBox(
                          height: 33,

                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () async {
                              userManager.notaexercicio(
                                notaenviar: (2),
                                id: (exercicio.id),
                              );
                            },
                            color: primaryColor,
                            textColor: Colors.white,
                            child: Text('Nota 2',
                                style: const TextStyle(fontSize: 18)),
                          ),
                        );
                      },
                    ),
                    Consumer<UserManager>(
                      builder: (_, userManager, __) {
                        return SizedBox(
                          height: 33,

                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () async {
                              userManager.notaexercicio(
                                notaenviar: (3),
                                id: (exercicio.id),
                              );
                            },
                            color: primaryColor,
                            textColor: Colors.white,
                            child: Text('Nota 3',
                                style: const TextStyle(fontSize: 18)),
                          ),
                        );
                      },
                    ),
                    Consumer<UserManager>(
                      builder: (_, userManager, __) {
                        return SizedBox(
                          height: 33,

                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () async {
                              userManager.notaexercicio(
                                notaenviar: (4),
                                id: (exercicio.id),
                              );
                            },
                            color: primaryColor,
                            textColor: Colors.white,
                            child: Text('Nota 4',
                                style: const TextStyle(fontSize: 18)),
                          ),
                        );
                      },
                    ),
                  ]),
                  Row(
                    children: [
                      Consumer<UserManager>(
                        builder: (_, userManager, __) {
                          return SizedBox(
                            height: 33,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () async {
                                userManager.notaexercicio(
                                  notaenviar: (5),
                                  id: (exercicio.id),
                                );
                              },
                              color: primaryColor,
                              textColor: Colors.white,
                              child: Text('Nota 5',
                                  style: const TextStyle(fontSize: 18)),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialogs(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Avaliação"),
      content: Text("Sua Avaliação foi Adicionada com Sucesso!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
