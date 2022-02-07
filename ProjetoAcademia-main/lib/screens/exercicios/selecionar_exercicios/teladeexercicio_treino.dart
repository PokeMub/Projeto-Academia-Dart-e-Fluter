import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/alunos_manager.dart';
import 'package:lojavirtual/models/exercicio.dart';
import 'package:lojavirtual/models/treinos.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/treino_manager.dart';
import 'package:provider/provider.dart';
//import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class TelaApresetacaodoExercicioeTreinoScreen extends StatelessWidget {
  TelaApresetacaodoExercicioeTreinoScreen(this.exercicio, this.treino);

  final Exercicio exercicio;
  final Treinos treino;
  int liberar = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return ChangeNotifierProvider.value(
      value: exercicio,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(exercicio.nameExercicio),
          centerTitle: true,
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
                        'Exercicio : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        exercicio.nameExercicio,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Parte do Corpo : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        exercicio.parteDoCorpo,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
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
                    height: 40,
                  ),
                  Consumer3<AlunosManager, UserManager, TreinoManager>(
                    builder:
                        (_, alunosManager, userManager, treinoManager, __) {
                      return SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () async {
                            liberar++;
                            if (liberar == 1) {
                              treino.iddoexercicio = exercicio.id;
                              treino.codigo = exercicio.codigo;
                              treino.excurta = exercicio.explicacaocurta;
                              treino.exlonga = exercicio.explicacaolonga;
                              treino.linkyoutube = exercicio.linkYoutube;
                              treino.objetivo = exercicio.objetivo;
                              treino.nomeexercicio = exercicio.nameExercicio;
                              treino.partedocorpo = exercicio.parteDoCorpo;

                              await treino.save();

                              showAlertDialog(context);
                            }
                          },
                          color: const Color(0xFFFF8F00),
                          textColor: Colors.white,
                          child: Text('Salvar Exercicio',
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
      title: Text("Treino do Aluno"),
      content: Text("Treino Criado Com Sucesso."),
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
