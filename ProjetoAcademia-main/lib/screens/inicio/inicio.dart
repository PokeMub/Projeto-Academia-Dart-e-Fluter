import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/products/products_screen.dart';
import 'package:lojavirtual/screens/professor/lista_professor.dart';
import 'package:provider/provider.dart';

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Product product;
    double sizeboxs = 10;

    int cargo = 0;

    //0 = aluno / 1 = professor / 2 = donodeacademia / 3 = universitario

    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tela Inicial'),
        ),
        body: Consumer<UserManager>(builder: (_, userManager, __) {
          userManager.versionprocurar(onFail: (e) {}, onSuccess: () {});
          return SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (((userManager.donodeAcademiaEnabled) ||
                            (userManager.personalProfessorEnabled) ||
                            (userManager.universitarioEnabled)) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text: 'Criar Treinos Para Alunos',
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
                            showAlertDialog(context);
                          } else {
                            Navigator.of(context).pushNamed(
                              '/setoraluno',
                            );
                          }
                        },
                      ),
                    ],
///////////////////////////////////////////////////////////////////////////////////
                    if (((!userManager.donodeAcademiaEnabled) &&
                            (!userManager.personalProfessorEnabled) &&
                            (!userManager.universitarioEnabled)) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text: 'Meus Treinos',
                        isReverse: true,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        // textStyle: submitTextStyle,
                        backgroundColor: Color(0xFF00B0FF),
                        borderColor: Colors.white,
                        borderRadius: 0,
                        borderWidth: 2,
                        onPress: () {
                          Navigator.of(context).pushNamed(
                            '/entrartelaAluno',
                          );
                        },
                      ),
                    ],
///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Exercicios',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed(
                          '/exercicios',
                        );
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    if ((userManager.personalProfessorEnabled) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text:
                            'Criar Um Currículo para ser (Professor/Personal)',
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
                            showAlertDialog(context);
                          } else {
                            if (userManager.universitarioEnabled) {
                              cargo = 3;
                            } else {
                              cargo = 1;
                            }

                            // cargo = 1;
                            //  Navigator.of(context).pushNamed('/listasprofessor',);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfessorDisponiveisScreen(cargo)),
                            );
                          }
                        },
                      ),
                    ],
                    if (((userManager.universitarioEnabled) &&
                            (!userManager.personalProfessorEnabled) &&
                            (!userManager.donodeAcademiaEnabled)) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text: 'Criar Um Currículo para ser (Estagiario)',
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
                            showAlertDialog(context);
                          } else {
                            if (userManager.universitarioEnabled) {
                              cargo = 3;
                            } else {
                              cargo = 1;
                            }

                            // cargo = 1;
                            //  Navigator.of(context).pushNamed('/listasprofessor',);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfessorDisponiveisScreen(cargo)),
                            );
                          }
                        },
                      ),
                    ],

                    if (((!userManager.personalProfessorEnabled) &&
                            (userManager.donodeAcademiaEnabled)) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text:
                            'Contratar Para Sua Academia (Professor/Personal)',
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
                            showAlertDialog(context);
                          } else {
                            cargo = 2;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfessorDisponiveisScreen(cargo)),
                            );
                          }
                        },
                      ),
                    ],
                    if (((!userManager.personalProfessorEnabled) &&
                            (!userManager.donodeAcademiaEnabled) &&
                            (!userManager.universitarioEnabled)) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text: 'Contratar Personal Privado',
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
                            showAlertDialog(context);
                          } else {
                            cargo = 0;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfessorDisponiveisScreen(cargo)));
                          }
                        },
                      ),
                    ],

///////////////////////////////////////////////////////////////////////////////////
                    if ((userManager.donodeAcademiaEnabled) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text: 'Minha Academia (Setor Fazendo)',
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
                            showAlertDialog(context);
                          } else {
                            Navigator.of(context).pushNamed(
                              '/minhaacademia',
                            );
                          }
                        },
                      ),
                    ],
///////////////////////////////////////////////////////////////////////////////////
                    if (((!userManager.donodeAcademiaEnabled) &&
                            (!userManager.personalProfessorEnabled) &&
                            (!userManager.universitarioEnabled)) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text: 'Meus Resultados de Rendimento',
                        isReverse: true,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        // textStyle: submitTextStyle,
                        backgroundColor: Color(0xFF00B0FF),
                        borderColor: Colors.white,
                        borderRadius: 0,
                        borderWidth: 2,
                        onPress: () {
                          Navigator.of(context).pushNamed(
                            '/dadosaluno',
                          );
                        },
                      ),
                    ],

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Procurar Academia',
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
                          showAlertDialog(context);
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ProductsScreen()),
                          );
                        }
                      },
                    ),
///////////////////////////////////////////////////////////////////////////////////

                    if (((userManager.donodeAcademiaEnabled) &&
                            (!userManager.personalProfessorEnabled) &&
                            (!userManager.universitarioEnabled)) ||
                        (userManager.adminEnabled)) ...[
                      SizedBox(height: sizeboxs * 2),
                      AnimatedButton(
                        height: 70,
                        width: 400,
                        text: 'Criar Academia',
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
                            showAlertDialog(context);
                          } else {
                            Navigator.of(context).pushNamed(
                              '/edit_product',
                            );
                          }
                          /*
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CriarAcademiaScreen()),
                            // builder: (context) => CriarAcademiatresScreen()),
                          );*/
                        },
                      ),
                    ],
                    //////////////////////////////////////////////////////////
                  ],
                ),
              ),
            ),
          );
        }));
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
