// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/proposta_professor.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class Eddintproposta extends StatelessWidget {
  Eddintproposta(this.proposta);

  final PropostaDeTrabalhoProfessor proposta;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contra Proposta'),
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Descrição do Trabalho',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    initialValue: proposta.descricaodotrabalho,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: 'Descrição do Trabalho',
                    ),
                    maxLines: null,
                    validator: (desc) {
                      if (desc.length < 15)
                        return 'Descrição do Trabalho Muito Curto';
                      return null;
                    },
                    onSaved: (desc) => proposta.descricaodotrabalho = desc,
                  ),
                  TextFormField(
                    initialValue: proposta.diasdasemana,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: 'Dias da Semana',
                    ),
                    maxLines: null,
                    validator: (descs) {
                      if (descs.length < 5) return 'Muito Curto';
                      return null;
                    },
                    onSaved: (descs) => proposta.diasdasemana = descs,
                  ),
                  TextFormField(
                    initialValue: proposta.horadetrabalho,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: 'Horas de Trabalho',
                    ),
                    maxLines: null,
                    validator: (desca) {
                      if (desca.length < 5) return 'Muito Curto';
                      return null;
                    },
                    onSaved: (desca) => proposta.horadetrabalho = desca,
                  ),
                  if (proposta.propostaconcluidaAcademia == true) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Salario proposto pela Academia : R\$ ${proposta.salarioPropostoAcademia}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      initialValue: proposta.salarioPropostoProfessor,
                      decoration: const InputDecoration(
                          labelText: 'Salario Proposto por Você',
                          prefixText: 'R\$'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (price) {
                        if (num.tryParse(price) == null) return 'Inválido';
                        return null;
                      },
                      onChanged: (price) =>
                          proposta.salarioPropostoProfessor = price,
                    ),
                  ],
                  if (proposta.propostaconcluidaprofessor == true) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Salario proposto pelo Professor : R\$ ${proposta.salarioPropostoProfessor}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      initialValue: proposta.salarioPropostoAcademia,
                      decoration: const InputDecoration(
                          labelText: 'Salario Proposto por Você',
                          prefixText: 'R\$'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (pricec) {
                        if (num.tryParse(pricec) == null) return 'Inválido';
                        return null;
                      },
                      onChanged: (pricec) =>
                          proposta.salarioPropostoAcademia = pricec,
                    ),
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<UserManager>(
                    builder: (_, userManager, __) {
                      return SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () async {
                            if (proposta.propostaconcluidaprofessor == true) {
                              proposta.propostaconcluidaprofessor = false;
                              proposta.propostaconcluidaAcademia = true;
                              proposta.updatedata();
                              showAlertDialog(context);
                            } else if (proposta.propostaconcluidaAcademia ==
                                true) {
                              proposta.propostaconcluidaprofessor = true;
                              proposta.propostaconcluidaAcademia = false;
                              proposta.updatedata();
                              showAlertDialog(context);
                            }
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Salvar ContraProposta',
                              style: const TextStyle(fontSize: 18)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
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
      title: Text("Contra Proposta"),
      content: Text("Contra Proposta Enviada Com Sucesso."),
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
