import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/alunos.dart';
import 'package:lojavirtual/models/alunos_manager.dart';
import 'package:lojavirtual/models/professor.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/professor/enviarproposta.dart';
import 'package:provider/provider.dart';

class TelaCurriculoProfessor extends StatelessWidget {
  const TelaCurriculoProfessor(this.cargo, this.prof);

  final Professor prof;
  final int cargo;

  @override
  Widget build(BuildContext context) {
    Alunos alun = Alunos();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double tamanho = (MediaQuery.of(context).size.height * 0.04) / 2;
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dados do Instrutor'),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //0 = aluno / 1 = professor / 2 = donodeacademia / 3 = universitario
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        'Nome : ${prof.name}',
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
                        'Sexo : ${prof.sexo}',
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
                        'Idade : ${prof.idade}',
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
                        'Telefone : ${prof.telefone}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  if (((cargo == 2) || (prof.userid == userManager.user.id)) ||
                      (userManager.adminEnabled)) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          'CREF : ${prof.cref}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        'Estado : ${prof.estado}',
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
                        'Cidade : ${prof.cidade}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  if (((cargo == 2) || (prof.userid == userManager.user.id)) ||
                      (userManager.adminEnabled)) ...[
                    SizedBox(height: tamanho * 2),
                    Row(
                      children: [
                        Text(
                          'Contratação',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho + (tamanho / 2)),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: AutoSizeText(
                              'Horario Disponivel : ${prof.horariodisponivel}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              minFontSize: 18,
                              maxLines: 3),
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: AutoSizeText(
                              'Dias da Semana : ${prof.diasdasemanadisponivel}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              minFontSize: 18,
                              maxLines: 3),
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          'Pretensão Salarial : R\$ ${prof.mediasalarial}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (cargo == 2 || userManager.adminEnabled) ...[
                      SizedBox(height: tamanho),
                      Consumer<UserManager>(
                        builder: (_, userManager, __) {
                          return SizedBox(
                            height: 44,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PropostaProfessor(prof)),
                                );
                              },
                              color: primaryColor,
                              textColor: Colors.white,
                              child: Text('Enviar Proposta',
                                  style: const TextStyle(fontSize: 18)),
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                  if (((cargo == 0) || (prof.userid == userManager.user.id)) ||
                      (userManager.adminEnabled)) ...[
                    SizedBox(height: tamanho * 2),
                    Row(
                      children: [
                        Text(
                          'Planos',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    if (prof.descricaoum != null && prof.valorum != null) ...[
                      SizedBox(height: tamanho + (tamanho / 2)),
                      Row(
                        children: [
                          Text(
                            'Plano 1 ',
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho / 2),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            child:
                                AutoSizeText('Descrição : ${prof.descricaoum}',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    minFontSize: 18,
                                    maxLines: 5),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho / 2),
                      Row(
                        children: [
                          Text(
                            'Valor : R\$ ${prof.valorum}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (cargo == 0 || userManager.adminEnabled) ...[
                        SizedBox(height: tamanho),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 44,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var moneyplano = double.parse(prof.valorum);
                                  var moneyusuario =
                                      double.parse(userManager.user.money);

                                  if (moneyusuario >= moneyplano) {
                                    userManager.moneycomprardata(
                                        money: (userManager.user.money),
                                        idreceber: (prof.userid),
                                        pagamento: (prof.valorum),
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
                                          alun.idaluno = userManager.user.id;
                                          alun.idacademia = prof.id;
                                          alun.plano = 'Plano 1';
                                          alun.valordoplano = prof.valorum;
                                          alun.name = userManager.user.name;
                                          alun.genero = userManager.user.sexo;
                                          alun.idade =
                                              userManager.user.datadenascimento;
                                          alun.tiposanguinio =
                                              userManager.user.tiposanguinio;

                                          alun.save();

                                          showAlertDialogs(context);
                                        });
                                  } else if (moneyusuario < moneyplano) {
                                    // ignore: deprecated_member_use
                                    scaffoldKey.currentState
                                        // ignore: deprecated_member_use
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Dinheiro Insuficiente para fazer a Contratação do Plano'),
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
                      ],
                    ],
                    //////////////////////////////////////////////////
                    if (prof.descricaodois != null &&
                        prof.valordois != null) ...[
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            'Plano 2 ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho / 2),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: AutoSizeText(
                                'Descrição : ${prof.descricaodois}',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                minFontSize: 18,
                                maxLines: 5),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho / 2),
                      Row(
                        children: [
                          Text(
                            'Valor : R\$ ${prof.valordois}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (cargo == 0 || userManager.adminEnabled) ...[
                        SizedBox(height: tamanho),
                        Consumer<UserManager>(
                          builder: (_, userManager, __) {
                            return SizedBox(
                              height: 44,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var moneyplano = double.parse(prof.valordois);
                                  var moneyusuario =
                                      double.parse(userManager.user.money);

                                  if (moneyusuario >= moneyplano) {
                                    userManager.moneycomprardata(
                                        money: (userManager.user.money),
                                        idreceber: (prof.userid),
                                        pagamento: (prof.valordois),
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
                                          alun.idaluno = userManager.user.id;
                                          alun.idacademia = prof.id;
                                          alun.plano = 'Plano 2';
                                          alun.valordoplano = prof.valordois;
                                          alun.name = userManager.user.name;
                                          alun.genero = userManager.user.sexo;
                                          alun.idade =
                                              userManager.user.datadenascimento;
                                          alun.tiposanguinio =
                                              userManager.user.tiposanguinio;

                                          alun.save();

                                          showAlertDialogs(context);
                                        });
                                  } else if (moneyusuario < moneyplano) {
                                    // ignore: deprecated_member_use
                                    scaffoldKey.currentState
                                        // ignore: deprecated_member_use
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Dinheiro Insuficiente para fazer a Contratação do Plano'),
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
                      ],
                    ],
                    ////////////////////////////////////////////////////////
                    if (prof.descricaotres != null &&
                        prof.valortres != null) ...[
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            'Plano 3 ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho / 2),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: AutoSizeText(
                                'Descrição : ${prof.descricaotres}',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                minFontSize: 18,
                                maxLines: 5),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho / 2),
                      Row(
                        children: [
                          Text(
                            'Valor : R\$ ${prof.valortres}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (cargo == 0 || userManager.adminEnabled) ...[
                        SizedBox(height: tamanho),
                        Consumer2<UserManager, AlunosManager>(
                          builder: (_, userManager, alunosManager, __) {
                            return SizedBox(
                              height: 44,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                onPressed: () async {
                                  var moneyplano = double.parse(prof.valortres);
                                  var moneyusuario =
                                      double.parse(userManager.user.money);

                                  if (moneyusuario >= moneyplano) {
                                    userManager.moneycomprardata(
                                        money: (userManager.user.money),
                                        idreceber: (prof.userid),
                                        pagamento: (prof.valortres),
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
                                          alun.idaluno = userManager.user.id;
                                          alun.idacademia = prof.id;
                                          alun.plano = 'Plano 3';
                                          alun.valordoplano = prof.valortres;
                                          alun.name = userManager.user.name;
                                          alun.genero = userManager.user.sexo;
                                          alun.idade =
                                              userManager.user.datadenascimento;
                                          alun.tiposanguinio =
                                              userManager.user.tiposanguinio;

                                          alun.save();

                                          showAlertDialogs(context);
                                        });
                                  } else if (moneyusuario < moneyplano) {
                                    // ignore: deprecated_member_use
                                    scaffoldKey.currentState
                                        // ignore: deprecated_member_use
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Dinheiro Insuficiente para fazer a Contratação do Plano'),
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
                      ],
                    ],
                  ],
                  SizedBox(height: tamanho),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    SizedBox(
                      height: 33,

                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () async {
                          userManager.notaFuncionario(
                            notaenviar: (1),
                            id: (prof.id),
                          );
                        },
                        color: primaryColor,
                        textColor: Colors.white,
                        child: Text('Nota 1',
                            style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 33,

                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () async {
                          userManager.notaFuncionario(
                            notaenviar: (2),
                            id: (prof.id),
                          );
                        },
                        color: primaryColor,
                        textColor: Colors.white,
                        child: Text('Nota 2',
                            style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 33,

                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () async {
                          userManager.notaFuncionario(
                            notaenviar: (3),
                            id: (prof.id),
                          );
                        },
                        color: primaryColor,
                        textColor: Colors.white,
                        child: Text('Nota 3',
                            style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 33,

                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () async {
                          userManager.notaFuncionario(
                            notaenviar: (4),
                            id: (prof.id),
                          );
                        },
                        color: primaryColor,
                        textColor: Colors.white,
                        child: Text('Nota 4',
                            style: const TextStyle(fontSize: 18)),
                      ),
                    )
                  ]),
                  Row(
                    children: [
                      SizedBox(
                        height: 33,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () async {
                            userManager.notaFuncionario(
                              notaenviar: (5),
                              id: (prof.id),
                            );
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Nota 5',
                              style: const TextStyle(fontSize: 18)),
                        ),
                      )
                    ],
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
        Navigator.of(context).pushNamed('/base');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Proposta"),
      content: Text("Proposta enviada com Sucesso!"),
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
        Navigator.of(context).pushNamed('/base');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Plano"),
      content: Text("Plano Contratado com Sucesso!"),
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
