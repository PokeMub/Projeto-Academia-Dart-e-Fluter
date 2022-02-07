import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PremiumScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PremiumScreens();
  }
}

class PremiumScreens extends State<PremiumScreen> {
  BuildContext get context => null;
  int money;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    double tamanho = MediaQuery.of(context).size.height * 0.04;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Planos Premium'),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (userManager.donodeAcademiaEnabled &&
                      !userManager.personalProfessorEnabled &&
                      !userManager.universitarioEnabled) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "30 Alunos 24 Reais   ",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('24');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Plano',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "70 Alunos 45 Reais   ",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('45');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Plano',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "100 Alunos 72 Reais   ",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('72');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Plano',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "300 Alunos 195 Reais   ",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('195');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Plano',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "500 Alunos 300 Reais   ",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('300');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Plano',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "1000 Alunos 500 Reais   ",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('500');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Plano',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                  if (!userManager.donodeAcademiaEnabled &&
                      !userManager.personalProfessorEnabled &&
                      !userManager.universitarioEnabled) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "Valor : 3,99 Reais",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "Validade 30 Dias",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    AutoSizeText(
                        "Beneficios : Criar o Proprio Treino, Resultados Liberado e Sem Propagandas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        minFontSize: 10,
                        maxLines: 3),
                    SizedBox(height: tamanho * 2),
                    Consumer<UserManager>(
                      builder: (_, userManager, __) {
                        return SizedBox(
                          height: 44,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () async {
                              var onePointOne = double.parse('3.99');
                              var onePointtwo =
                                  double.parse(userManager.user.money);

                              onePointtwo = onePointtwo - onePointOne;

                              userManager.user.money = onePointtwo.toString();
                              print(userManager.user.money);

                              userManager.moneydata(
                                  money: (userManager.user.money),
                                  onSuccess: () {
                                    Fluttertoast.showToast(msg: 'Successo');
                                    showAlertDialogs(context);
                                  },
                                  onFail: (e) {
                                    Fluttertoast.showToast(msg: 'Falha');
                                  });
                            },
                            color: primaryColor,
                            textColor: Colors.white,
                            child: Text('Contratar Premium',
                                style: const TextStyle(fontSize: 18)),
                          ),
                        );
                      },
                    ),
                  ],
                  if (!userManager.donodeAcademiaEnabled &&
                      userManager.personalProfessorEnabled &&
                      !userManager.universitarioEnabled) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "3 Alunos : 2,40 Reais",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('2.40');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Premium',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "6 Alunos : 4,80 Reais",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('4.80');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Premium',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "10 Alunos : 7,50 Reais",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('7.50');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Premium',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          "20 Alunos : 14 Reais",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 33,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var onePointOne = double.parse('14');
                                  var onePointtwo =
                                      double.parse(userManager.user.money);

                                  onePointtwo = onePointtwo - onePointOne;

                                  userManager.user.money =
                                      onePointtwo.toString();
                                  print(userManager.user.money);

                                  userManager.moneydata(
                                      money: (userManager.user.money),
                                      onSuccess: () {
                                        Fluttertoast.showToast(msg: 'Successo');
                                        showAlertDialogs(context);
                                      },
                                      onFail: (e) {
                                        Fluttertoast.showToast(msg: 'Falha');
                                      });
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child: Text('Contratar Premium',
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: tamanho * 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

/*
  var onePointOne = double.parse('500');
                        var onePointtwo = double.parse(userManager.user.money);

                        onePointtwo = onePointtwo + onePointOne;

                        userManager.user.money = onePointtwo.toString();
                        print(userManager.user.money);

                        userManager.moneydata(
                            money: (userManager.user.money),
                            onSuccess: () {
                              Fluttertoast.showToast(msg: 'Successo');
                              Navigator.of(context).pop();
                            },
                            onFail: (e) {
                              Fluttertoast.showToast(msg: 'Falha');
                            });
*/
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Money"),
      content: Text("500 Reais Foi Adicionado a sua Conta."),
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

  showAlertDialogs(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Premium"),
      content: Text("Premium Comprado com Sucesso !"),
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
