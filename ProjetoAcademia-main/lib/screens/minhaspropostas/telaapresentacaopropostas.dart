import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/professor_funcionario.dart';
import 'package:lojavirtual/models/professor_funcionario_manager.dart';
import 'package:lojavirtual/models/proposta_professor.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/minhaspropostas/contra_proposta.dart';
import 'package:provider/provider.dart';

class TelaApresentacaoPropostas extends StatelessWidget {
  const TelaApresentacaoPropostas(this.proposta);

  final PropostaDeTrabalhoProfessor proposta;

  @override
  Widget build(BuildContext context) {
    final ProfessorFuncionario funcionario = ProfessorFuncionario();

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double tamanho = (MediaQuery.of(context).size.height * 0.04) / 2;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Proposta de Trabalho'),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //***********************************************//
                  //***********************************************//
                  //***************OFLINE**************************//
                  //***********************************************//
                  //***********************************************//
                  if (proposta.online == false) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          'Descrição do Trabalho: : ${proposta.descricaodotrabalho}',
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
                          'Dias da Semana : ${proposta.diasdasemana}',
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
                          'Horas de Trabalho : ${proposta.horadetrabalho}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if ((proposta.salarioPropostoAcademia != null) &&
                        (proposta.salarioPropostoProfessor != null)) ...[
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            'Salario Proposto Pelo Professor : ${proposta.salarioPropostoProfessor}',
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
                            'Salario Proposto Pela Academia : ${proposta.salarioPropostoAcademia}',
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
                          'A Proposta foi Encerrada',
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],

                  //***********************************************//
                  //***********************************************//
                  //***************AREA ACADEMIA*******************//
                  //**************RESPOSTA para PROFESSOR************//
                  //***********************************************//
                  if (userManager.academicEnabled &&
                      (proposta.propostaconcluidaAcademia == false) &&
                      (proposta.propostaconcluidaprofessor == true)) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          'Descrição do Trabalho: : ${proposta.descricaodotrabalho}',
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
                          'Dias da Semana : ${proposta.diasdasemana}',
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
                          'Horas de Trabalho : ${proposta.horadetrabalho}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (proposta.salarioPropostoProfessor != null) ...[
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            'Salario Proposto Pelo Professor : ${proposta.salarioPropostoProfessor}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: tamanho * 2),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer2<UserManager, ProfessorFuncionarioManager>(
                            builder: (_, userManager,
                                professorFuncionarioManager, __) {
                              return SizedBox(
                                height: 44,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  onPressed: () async {
                                    DocumentSnapshot docs = await Firestore
                                        .instance
                                        .collection('Professor_Dados_ALL')
                                        .document(proposta.idprofessor)
                                        .get();

                                    funcionario.id = docs.data['userid'];
                                    funcionario.iddonodaacademia =
                                        proposta.iddonoacademia;
                                    funcionario.cref = docs.data['cref'];
                                    funcionario.name = docs.data['name'];
                                    funcionario.telefone =
                                        docs.data['telefone'];
                                    funcionario.salario =
                                        proposta.salarioPropostoProfessor;
                                    funcionario.horaspordia =
                                        proposta.horadetrabalho;
                                    funcionario.diasdasemana =
                                        proposta.diasdasemana;
                                    funcionario.descricaodotrabalho =
                                        proposta.descricaodotrabalho;

                                    funcionario.save();

                                    proposta.propostaconcluidaprofessor = true;
                                    proposta.propostaconcluidaAcademia = true;
                                    proposta.online = false;
                                    proposta.updatedata();
                                    showAlertDialogs(context);
                                    //////////////////////////////////////////////////////////////////////////////////////////////////////
                                  },
                                  color: primaryColor,
                                  textColor: Colors.white,
                                  child: Text('Aceitar',
                                      style: const TextStyle(fontSize: 18)),
                                ),
                              );
                            },
                          ),
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
                                              Eddintproposta(proposta)),
                                    );
                                  },
                                  color: primaryColor,
                                  textColor: Colors.white,
                                  child: Text('Contraproposta',
                                      style: const TextStyle(fontSize: 18)),
                                ),
                              );
                            },
                          ),
                          Consumer<UserManager>(
                            builder: (_, userManager, __) {
                              return SizedBox(
                                height: 44,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  onPressed: () async {
                                    proposta.propostaconcluidaprofessor = true;
                                    proposta.propostaconcluidaAcademia = true;
                                    proposta.online = false;
                                    proposta.updatedata();
                                    showAlertDialog(context);
                                  },
                                  color: primaryColor,
                                  textColor: Colors.white,
                                  child: Text('Recusar',
                                      style: const TextStyle(fontSize: 18)),
                                ),
                              );
                            },
                          ),
                        ]),
                  ],

                  //***********************************************//
                  //***********************************************//
                  //***************AREA ACADEMIA*******************//
                  //**************AGUARDO DA RESPOSTA**************//
                  //***********************************************//
                  if (userManager.academicEnabled &&
                      (proposta.propostaconcluidaAcademia == true) &&
                      (proposta.propostaconcluidaprofessor == false)) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          'Descrição do Trabalho: : ${proposta.descricaodotrabalho}',
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
                          'Dias da Semana : ${proposta.diasdasemana}',
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
                          'Horas de Trabalho : ${proposta.horadetrabalho}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (proposta.salarioPropostoAcademia != null) ...[
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            'Salario Proposto Pela Academia : ${proposta.salarioPropostoAcademia}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: tamanho * 2),
                    Row(
                      children: [
                        Text(
                          'Aguardando Resposta do Professor/Personal',
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho),
                  ],

                  //***********************************************//
                  //***********************************************//
                  //***************AREA PROFESSOR******************//
                  //*************AGUARDO RESPOSTA******************//
                  //***********************************************//

                  if ((userManager.personalProfessorEnabled ||
                          userManager.universitarioEnabled) &&
                      (proposta.propostaconcluidaAcademia == false) &&
                      (proposta.propostaconcluidaprofessor == true)) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          'Nome da Academia : ${proposta.nameAcademy}',
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
                          'Cep da Academia : ${proposta.cepAcademy}',
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
                          'Descrição do Trabalho: : ${proposta.descricaodotrabalho}',
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
                          'Dias da Semana : ${proposta.diasdasemana}',
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
                          'Dias da Hora de Trabalho : ${proposta.horadetrabalho}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (proposta.salarioPropostoProfessor != null) ...[
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            'Salario Proposto Por Voçê : ${proposta.salarioPropostoProfessor}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: tamanho * 2),
                    Row(
                      children: [
                        Text(
                          'Aguardando Resposta do Dono da Academia',
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: tamanho * 2),
                  ],

                  //***********************************************//
                  //***********************************************//
                  //***************AREA PROFESSOR*******************//
                  //**************RESPOSTA para ACADEMIA************//
                  //***********************************************//

                  if ((userManager.personalProfessorEnabled ||
                          userManager.universitarioEnabled) &&
                      ((proposta.propostaconcluidaAcademia == true) &&
                          (proposta.propostaconcluidaprofessor == false))) ...[
                    SizedBox(height: tamanho),
                    Row(
                      children: [
                        Text(
                          'Nome da Academia : ${proposta.nameAcademy}',
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
                          'Cep da Academia : ${proposta.cepAcademy}',
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
                          'Descrição do Trabalho: : ${proposta.descricaodotrabalho}',
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
                          'Dias da Semana : ${proposta.diasdasemana}',
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
                          'Dias da Hora de Trabalho : ${proposta.horadetrabalho}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (proposta.salarioPropostoAcademia != null) ...[
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            'Salario Proposto Pela Academia : ${proposta.salarioPropostoAcademia}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: tamanho * 2),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<UserManager>(
                            builder: (_, userManager, __) {
                              return SizedBox(
                                height: 44,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  onPressed: () async {
                                    DocumentSnapshot docs = await Firestore
                                        .instance
                                        .collection('Professor_Dados_ALL')
                                        .document(proposta.idprofessor)
                                        .get();

                                    funcionario.id = docs.data['userid'];
                                    funcionario.iddonodaacademia =
                                        proposta.iddonoacademia;
                                    funcionario.cref = docs.data['cref'];
                                    funcionario.name = docs.data['name'];
                                    funcionario.telefone =
                                        docs.data['telefone'];
                                    funcionario.salario =
                                        proposta.salarioPropostoAcademia;
                                    funcionario.horaspordia =
                                        proposta.horadetrabalho;
                                    funcionario.diasdasemana =
                                        proposta.diasdasemana;
                                    funcionario.descricaodotrabalho =
                                        proposta.descricaodotrabalho;

                                    funcionario.save();

                                    proposta.propostaconcluidaprofessor = true;
                                    proposta.propostaconcluidaAcademia = true;
                                    proposta.online = false;
                                    proposta.updatedata();
                                    showAlertDialogs(context);

                                    //  userManager.adicionarfuncionario(
                                    //    proposta.iddonoacademia,
                                    //     proposta.idprofessor);
                                  },
                                  color: primaryColor,
                                  textColor: Colors.white,
                                  child: Text('Aceitar',
                                      style: const TextStyle(fontSize: 18)),
                                ),
                              );
                            },
                          ),
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
                                              Eddintproposta(proposta)),
                                    );
                                  },
                                  color: primaryColor,
                                  textColor: Colors.white,
                                  child: Text('Contraproposta',
                                      style: const TextStyle(fontSize: 18)),
                                ),
                              );
                            },
                          ),
                          Consumer<UserManager>(
                            builder: (_, userManager, __) {
                              return SizedBox(
                                height: 44,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  onPressed: () async {
                                    proposta.propostaconcluidaprofessor = true;
                                    proposta.propostaconcluidaAcademia = true;
                                    proposta.online = false;
                                    proposta.updatedata();
                                    showAlertDialog(context);
                                  },
                                  color: primaryColor,
                                  textColor: Colors.white,
                                  child: Text('Recusar',
                                      style: const TextStyle(fontSize: 18)),
                                ),
                              );
                            },
                          ),
                        ]),
                  ],
                  SizedBox(height: tamanho),
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
      content: Text("Proposta Recusada com Sucesso!"),
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
      title: Text("Proposta"),
      content: Text("Proposta Aceito com Sucesso!"),
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
