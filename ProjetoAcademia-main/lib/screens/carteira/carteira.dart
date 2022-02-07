import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CarteiraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarteiraScreens();
  }
}

class CarteiraScreens extends State<CarteiraScreen> {
  BuildContext get context => null;
  int money;

  @override
  Widget build(BuildContext context) {
    double tamanho = MediaQuery.of(context).size.height * 0.04;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Carteira'),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.cake, color: Colors.white),
                      Text(
                        " Money: ",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: AutoSizeText(
                            'R\$ ${userManager.user?.money ?? 'Atualizar o Cadastro ...'}',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            minFontSize: 5,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho * 2),

                  //if(true)

                  AnimatedButton(
                    height: 70,
                    width: 400,
                    text: 'Adicionar Money',
                    isReverse: true,
                    selectedTextColor: Colors.black,
                    transitionType: TransitionType.LEFT_TO_RIGHT,
                    // textStyle: submitTextStyle,
                    backgroundColor: Color(0xFF00B0FF),
                    borderColor: Colors.white,
                    borderRadius: 0,
                    borderWidth: 2,
                    onPress: () {
                      if (userManager.user.cpf == null) {
                        showAlertDialogs(context);
                      } else {
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

                        showAlertDialog(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

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
      title: Text("Atualizar Dados"),
      content: Text(
          "Lembre-se de Atualizar seu Dados, para liberar novas Funcionalidades !"),
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
