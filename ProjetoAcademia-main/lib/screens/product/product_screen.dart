// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/alunos.dart';
import 'package:lojavirtual/models/alunos_manager.dart';
import 'package:lojavirtual/models/product.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen(this.product);

  final Product product;

  @override
  State<ProductScreen> createState() =>
      _ProductScreenState(); //mudança importante
}

class _ProductScreenState extends State<ProductScreen> {
  Alunos alunoss;

  String valordoplano;

  String planoescolhido;

  bool liberar = true;

  @override
  Widget build(BuildContext context) {
    final Alunos alunoss = Alunos();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double sizeboxs = 10;
    final primaryColor = Theme.of(context).primaryColor;

    return ChangeNotifierProvider.value(
      value: widget.product,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(widget.product.nameAcademy),
          centerTitle: true,
          actions: <Widget>[
            Consumer<UserManager>(
              builder: (_, userManager, __) {
                if (userManager.adminEnabled ||
                    widget.product.id == userManager.user.id) {
                  return IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          '/edit_product',
                          arguments: widget.product);
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
            AspectRatio(
              aspectRatio: 1,
              child: Carousel(
                images: widget.product.images.map((url) {
                  return NetworkImage(url);
                }).toList(),
                dotSize: 4,
                dotSpacing: 15,
                dotBgColor: Colors.transparent,
                dotColor: primaryColor,
                autoplay: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Proprietário ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.product.nameCriadorAcademy,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    widget.product.bibiografiaAcademy,
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: sizeboxs),
                  Row(
                    children: [
                      Text(
                        'Planos :',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

                  SizedBox(height: sizeboxs),

                  Row(
                    children: [
                      Text(
                        'Plano 1 : ${widget.product.qtdplanoumAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Periodo : ${widget.product.periodoplanoumAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

                  Text(
                    'Instrutor : ${widget.product.intrutorplanoumAcademy}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),

                  Row(
                    children: [
                      Text(
                        'Valor : R\$ ${widget.product.planoumvalorAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer3<UserManager, Product, AlunosManager>(
                    builder: (_, userManager, product, alunosManager, __) {
                      return SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () async {
                            /////////////////////////
                            planoescolhido = product.planoumnameAcademy;
                            valordoplano = product.planoumvalorAcademy;

                            //  showAlertDialogs(context);
                            ///////////////////////////////

                            if (userManager.user.id != product.id) {
                              var moneyplano =
                                  double.parse(product.planoumvalorAcademy);
                              var moneyusuario =
                                  double.parse(userManager.user.money);

                              if (moneyusuario >= moneyplano) {
                                showAlertDialog(context);
                                userManager.moneycomprardata(
                                    money: (userManager.user.money),
                                    idreceber: (widget.product.id),
                                    pagamento: (product.planoumvalorAcademy),
                                    onFail: (e) {
                                      scaffoldKey.currentState
                                          // ignore: deprecated_member_use
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Falha ao Contratar Plano. $e'),
                                        backgroundColor: Colors.red,
                                      ));
                                    },
                                    onSuccess: () {
                                      alunoss.idaluno = userManager.user.id;
                                      alunoss.idacademia = product.id;
                                      alunoss.plano =
                                          product.planoumnameAcademy;
                                      alunoss.valordoplano =
                                          product.planoumvalorAcademy;

                                      alunoss.tiposanguinio =
                                          userManager.user.tiposanguinio;
                                      alunoss.genero = userManager.user.sexo;
                                      alunoss.idade =
                                          userManager.user.datadenascimento;
                                      alunoss.name = userManager.user.name;

                                      alunosManager.addalunos(
                                          alun: alunoss,
                                          onSuccess: () {},
                                          onFail: (e) {
                                            scaffoldKey.currentState
                                                // ignore: deprecated_member_use
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Falha ao Contratar Plano $e'),
                                              backgroundColor: Colors.red,
                                            ));
                                          });
                                    });
                              } else if (moneyusuario < moneyplano) {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'Dinheiro Insuficiente para fazer a Contratação do Plano'),
                                  backgroundColor: Colors.red,
                                ));
                              } else if (product.alunos[1] ==
                                  userManager.user.id) {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text('Você ja Contratou esse Plano'),
                                  backgroundColor: Colors.red,
                                ));
                              } else {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                      Text('Um erro Indefinido Ocorreu...'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            } else {
                              // ignore: deprecated_member_use
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    'Você Não Pode Contratar um Plano da Propria Academia'),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Contratar Plano 1',
                              style: const TextStyle(fontSize: 18)),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ///////////////////////////////////////////////////////////////
                  SizedBox(height: sizeboxs),
                  Row(
                    children: [
                      Text(
                        'Plano 2 : ${widget.product.qtdplanodoisAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Periodo : ${widget.product.periodoplanodoisAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    'Instrutor : ${widget.product.intrutorplanodoisAcademy}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'Valor : R\$ ${widget.product.planodoisvalorAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer3<UserManager, Product, AlunosManager>(
                    builder: (_, userManager, product, alunosManager, __) {
                      return SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () async {
                            /////////////////////////
                            planoescolhido = product.planodoisnameAcademy;
                            valordoplano = product.planodoisvalorAcademy;
                            //  showAlertDialogs(context);
                            ///////////////////////////////

                            if (userManager.user.id != product.id) {
                              var moneyplano =
                                  double.parse(product.planodoisvalorAcademy);
                              var moneyusuario =
                                  double.parse(userManager.user.money);

                              if (moneyusuario >= moneyplano) {
                                showAlertDialog(context);
                                userManager.moneycomprardata(
                                    money: (userManager.user.money),
                                    idreceber: (product.id),
                                    pagamento: (product.planodoisvalorAcademy),
                                    //   idacademia: (product.id),
                                    onFail: (e) {
                                      scaffoldKey.currentState
                                          // ignore: deprecated_member_use
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Falha ao Contratar Plano. $e'),
                                        backgroundColor: Colors.red,
                                      ));
                                    },
                                    onSuccess: () {
                                      alunoss.idaluno = userManager.user.id;
                                      alunoss.idacademia = product.id;
                                      alunoss.plano =
                                          product.planodoisnameAcademy;
                                      alunoss.valordoplano =
                                          product.planodoisvalorAcademy;

                                      alunoss.tiposanguinio =
                                          userManager.user.tiposanguinio;
                                      alunoss.genero = userManager.user.sexo;
                                      alunoss.idade =
                                          userManager.user.datadenascimento;
                                      alunoss.name = userManager.user.name;

                                      alunosManager.addalunos(
                                          alun: alunoss,
                                          onSuccess: () {},
                                          onFail: (e) {
                                            scaffoldKey.currentState
                                                // ignore: deprecated_member_use
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Falha ao Contratar Plano $e'),
                                              backgroundColor: Colors.red,
                                            ));
                                          });
                                    });
                              } else if (moneyusuario < moneyplano) {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'Dinheiro Insuficiente para fazer a Contratação do Plano'),
                                  backgroundColor: Colors.red,
                                ));
                              } else if (product.alunos[1] ==
                                  userManager.user.id) {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text('Você ja Contratou esse Plano'),
                                  backgroundColor: Colors.red,
                                ));
                              } else {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                      Text('Um erro Indefinido Ocorreu...'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            } else {
                              // ignore: deprecated_member_use
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    'Você Não Pode Contratar um Plano da Propria Academia'),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Contratar Plano 2',
                              style: const TextStyle(fontSize: 18)),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ///////////////////////////////////////////////////////////
                  SizedBox(height: sizeboxs),
                  Row(
                    children: [
                      Text(
                        'Plano 3 : ${widget.product.qtdplanotresAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Periodo : ${widget.product.periodoplanotresAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    'Instrutor : ${widget.product.intrutorplanotresAcademy}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'Valor : R\$ ${widget.product.planotresvalorAcademy}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer3<UserManager, Product, AlunosManager>(
                    builder: (_, userManager, product, alunosManager, __) {
                      return SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () async {
                            /////////////////////////
                            planoescolhido = product.planotresnameAcademy;
                            valordoplano = product.planotresvalorAcademy;
                            //  showAlertDialogs(context);
                            ///////////////////////////////

                            if (userManager.user.id != product.id) {
                              var moneyplano =
                                  double.parse(product.planotresvalorAcademy);
                              var moneyusuario =
                                  double.parse(userManager.user.money);

                              if (moneyusuario >= moneyplano) {
                                showAlertDialog(context);
                                userManager.moneycomprardata(
                                    money: (userManager.user.money),
                                    idreceber: (product.id),
                                    pagamento: (product.planotresvalorAcademy),
                                    //   idacademia: (product.id),
                                    onFail: (e) {
                                      scaffoldKey.currentState
                                          // ignore: deprecated_member_use
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Falha ao Contratar Plano. $e'),
                                        backgroundColor: Colors.red,
                                      ));
                                    },
                                    onSuccess: () {
                                      alunoss.idaluno = userManager.user.id;
                                      alunoss.idacademia = product.id;
                                      alunoss.plano =
                                          product.planotresnameAcademy;
                                      alunoss.valordoplano =
                                          product.planotresvalorAcademy;

                                      alunoss.tiposanguinio =
                                          userManager.user.tiposanguinio;
                                      alunoss.genero = userManager.user.sexo;
                                      alunoss.idade =
                                          userManager.user.datadenascimento;
                                      alunoss.name = userManager.user.name;

                                      alunosManager.addalunos(
                                          alun: alunoss,
                                          onSuccess: () {},
                                          onFail: (e) {
                                            scaffoldKey.currentState
                                                // ignore: deprecated_member_use
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Falha ao Contratar Plano $e'),
                                              backgroundColor: Colors.red,
                                            ));
                                          });
                                    });
                              } else if (moneyusuario < moneyplano) {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'Dinheiro Insuficiente para fazer a Contratação do Plano'),
                                  backgroundColor: Colors.red,
                                ));
                              } else if (product.alunos[1] ==
                                  userManager.user.id) {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text('Você ja Contratou esse Plano'),
                                  backgroundColor: Colors.red,
                                ));
                              } else {
                                // ignore: deprecated_member_use
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                      Text('Um erro Indefinido Ocorreu...'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            } else {
                              // ignore: deprecated_member_use
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    'Você Não Pode Contratar um Plano da Propria Academia'),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Contratar Plano 3',
                              style: const TextStyle(fontSize: 18)),
                        ),
                      );
                    },
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
                              userManager.notaAcademia(
                                notaenviar: (1),
                                id: (widget.product.id),
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
                              userManager.notaAcademia(
                                notaenviar: (2),
                                id: (widget.product.id),
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
                              userManager.notaAcademia(
                                notaenviar: (3),
                                id: (widget.product.id),
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
                              userManager.notaAcademia(
                                notaenviar: (4),
                                id: (widget.product.id),
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
                                userManager.notaAcademia(
                                  notaenviar: (5),
                                  id: (widget.product.id),
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
                  /*
                  SizedBox(height: sizeboxs),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Escolhar o Plano',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  */
                  /*
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: product.sizes.map((s) {
                      return SizeWidget(size: s);
                    }).toList(),
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  
                  Consumer2<UserManager, Product>(
                    builder: (_, userManager, product, __) {
                      return SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: product.selectedSize != null
                              ? () {
                                  if (userManager.isLoggedIn) {
                                    Navigator.of(context).pushNamed('/base');
                                  } else {
                                    Navigator.of(context).pushNamed('/login');
                                  }
                                }
                              : null,
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text(
                            userManager.isLoggedIn
                                ? 'Contratar Plano 1'
                                : 'Efetue o Login',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer2<UserManager, Product>(
                    builder: (_, userManager, product, __) {
                      return SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: product.selectedSize != null
                              ? () {
                                  if (userManager.isLoggedIn) {
                                    Navigator.of(context).pushNamed('/base');
                                  } else {
                                    Navigator.of(context).pushNamed('/login');
                                  }
                                }
                              : null,
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text(
                            userManager.isLoggedIn
                                ? 'Contratar Plano 2'
                                : 'Efetue o Login',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer2<UserManager, Product>(
                    builder: (_, userManager, product, __) {
                      return SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: product.selectedSize != null
                              ? () {
                                  if (userManager.isLoggedIn) {
                                    Navigator.of(context).pushNamed('/base');
                                  } else {
                                    Navigator.of(context).pushNamed('/login');
                                  }
                                }
                              : null,
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text(
                            userManager.isLoggedIn
                                ? 'Contratar Plano 3'
                                : 'Efetue o Login',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                  */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialogss(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Plano"),
      content: Text("Operação Cancelada."),
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

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pushNamed('/base');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Plano"),
      content: Text(
          "Compra do Plano Efetuado com Sucesso\n\nFoi Descontado R\$ ${valordoplano} da sua Carteira."),
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
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        liberar = false;
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        liberar = true;
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Plano ${planoescolhido}"),
      content: Text(
          "Você Realmente Deseja Fazer a Compra do ${planoescolhido} por R\$ ${valordoplano}?"),
      actions: [
        cancelButton,
        continueButton,
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
