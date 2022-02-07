import 'package:flutter/material.dart';
import 'package:lojavirtual/models/alunos.dart';
import 'package:lojavirtual/models/alunos_manager.dart';
import 'package:lojavirtual/models/dados_alunos.dart';
import 'package:lojavirtual/models/product_manager.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class ColetagemDasinformacoesdoAluno extends StatelessWidget {
  ColetagemDasinformacoesdoAluno(this.alunoss);

  final Alunos alunoss;
  final ColetadeDadosdoAluno dados = ColetadeDadosdoAluno();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Coleta de Dados'),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Nome Do Aluno : ${alunoss.name}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Peso Do Aluno (Kg)'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (peso) {
                      if (num.tryParse(peso) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (peso) => dados.peso = peso,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Altura do Aluno (Cm)'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (altura) {
                      if (num.tryParse(altura) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (altura) => dados.altura = altura,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Dobras Cutâneas Pollock',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                    ),
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'Trícipes'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (tricipes) {
                      if (num.tryParse(tricipes) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (tricipes) => dados.tricipe = tricipes,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Subescapular'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (subescapular) {
                      if (num.tryParse(subescapular) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (subescapular) =>
                        dados.subscapular = subescapular,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'Bíceps'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (bicipes) {
                      if (num.tryParse(bicipes) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (bicipes) => dados.bicipes = bicipes,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Axiliar Médial'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (axiliar) {
                      if (num.tryParse(axiliar) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (axiliar) => dados.axilarmedia = axiliar,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Torácica ou Peitoral'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (axiliar) {
                      if (num.tryParse(axiliar) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (axiliar) => dados.toracica = axiliar,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Supra Ilíaca'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (supra) {
                      if (num.tryParse(supra) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (supra) => dados.suprailiaca = supra,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Supra Espinal'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (sspinal) {
                      if (num.tryParse(sspinal) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (sspinal) => dados.supraespinal = sspinal,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'Coxa'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (coxa) {
                      if (num.tryParse(coxa) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (coxa) => dados.coxa = coxa,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Panturrilha Médial'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (panturrilha) {
                      if (num.tryParse(panturrilha) == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (panturrilha) => dados.panturilha = panturrilha,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Consumer3<AlunosManager, UserManager, ProductManager>(
                    builder:
                        (_, alunosManager, userManager, productManager, __) {
                      return SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              dados.idaluno = alunoss.idaluno;
                              dados.idacademia = userManager.user.id;
                              dados.name = alunoss.name;

                              var doublealtura = double.parse(dados.altura);
                              var doublepeso = double.parse(dados.peso);

                              double imc;
                              String enviar;

                              imc = doublepeso / (doublealtura * 2);
                              enviar = imc.toString();
                              dados.imc = enviar;

                              //dados.date = DateTim

                              await dados.save();

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
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Salvar Informações do Aluno',
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
      title: Text("Dados do Aluno"),
      content: Text("Coleta de Dados Salvo Com Sucesso."),
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
