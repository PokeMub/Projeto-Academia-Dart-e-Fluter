import 'package:flutter/material.dart';
import 'package:lojavirtual/models/exercicio.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CriarExercicio extends StatelessWidget {
  CriarExercicio(this.codigo);

  final Exercicio exercicios = Exercicio();

  final int codigo;

  int liberacao = 0;

  String youtubes, names, partedocorpo, objetivos, excurta, exlonga;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Criar Exercicio'),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Nome do Exercicio '),
                    validator: (name) {
                      if (name == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (name) => exercicios.nameExercicio = name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Parte do Corpo'),
                    validator: (corpo) {
                      if (corpo == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (corpo) => exercicios.parteDoCorpo = corpo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'Objetivo'),
                    validator: (objetivo) {
                      if (objetivo == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (objetivo) => exercicios.objetivo = objetivo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Explicação Curta'),
                    validator: (explicacao) {
                      if (explicacao == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (explicacao) =>
                        exercicios.explicacaocurta = explicacao,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Explicação Longa'),
                    validator: (explicacaol) {
                      if (explicacaol == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (explicacaol) =>
                        exercicios.explicacaolonga = explicacaol,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Link do Exercicio (Youtube)'),
                    validator: (youtube) {
                      if (youtube == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (youtube) => exercicios.linkYoutube = youtube,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */
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
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              if (liberacao == 0) {
                                liberacao++;

                                exercicios.idCriador = userManager.user.id;
                                exercicios.nameCriador = userManager.user.name;
                                exercicios.codigo = codigo;
                                exercicios.nota = 0;

                                //   exercicios.parteDoCorpo = partedocorpo;
                                //  exercicios.objetivo = objetivos;
                                //  exercicios.explicacaocurta = excurta;
                                // exercicios.explicacaolonga = exlonga;

                                //dados.date = DateTim

                                await exercicios.save();

                                showAlertDialog(context);
                                /* alunosManager.salvardadosaluno(
                                  dadosdoalun: dados,
                                  onFail: (e) {
                                    scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Falha ao Salvar Dados do Aluno: $e'),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                  onSuccess: () {});*/
                              }
                            }
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Criar Exercicio',
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
      title: Text("Exercicio"),
      content: Text("Exercicio Criado Com Sucesso."),
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
