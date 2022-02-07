import 'package:flutter/material.dart';
import 'package:lojavirtual/models/professor.dart';
import 'package:lojavirtual/models/proposta_professor.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class PropostaProfessor extends StatelessWidget {
  PropostaProfessor(this.prof);

  final Professor prof;

  @override
  Widget build(BuildContext context) {
    PropostaDeTrabalhoProfessor proposta = PropostaDeTrabalhoProfessor();

    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Proposta'),
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
                      'Nome do Professor : ${prof.name}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Descrição do Trabalho'),
                    validator: (treino) {
                      if (treino == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (treino) =>
                        proposta.descricaodotrabalho = treino,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Dias da Semana'),
                    validator: (dias) {
                      if (dias == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (dias) => proposta.diasdasemana = dias,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Horas de Trabalho'),
                    validator: (tipo) {
                      if (tipo == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (tipo) => proposta.horadetrabalho = tipo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Salario', prefixText: 'R\$'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (price) {
                      if (num.tryParse(price) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (price) =>
                        proposta.salarioPropostoAcademia = price,
                  ),
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
                            proposta.idprofessor = prof.userid;
                            proposta.iddonoacademia = userManager.user.id;
                            proposta.propostaconcluidaAcademia = true;
                            proposta.propostaconcluidaprofessor = false;
                            // proposta.save();

                            userManager.criarpropostaacademiaprofessor(
                                proposta, userManager.user.id);

                            showAlertDialog(context);
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
}
