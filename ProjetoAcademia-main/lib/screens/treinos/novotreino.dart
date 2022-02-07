import 'package:flutter/material.dart';
import 'package:lojavirtual/models/alunos.dart';
import 'package:lojavirtual/models/alunos_manager.dart';
import 'package:lojavirtual/models/product_manager.dart';
import 'package:lojavirtual/models/treinos.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/exercicios/selecionar_exercicios/partesdocorpo.dart';
import 'package:provider/provider.dart';

class NovoTreino extends StatelessWidget {
  NovoTreino(this.alunoss);

  final Alunos alunoss;
  final Treinos dados = Treinos();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Novo Treino'),
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
                      'Treino pro Aluno : ${alunoss.name}',
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
                        const InputDecoration(labelText: 'Nome do Treino'),
                    validator: (treino) {
                      if (treino == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (treino) => dados.nomedotreino = treino,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'Dias'),
                    validator: (dias) {
                      if (dias == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (dias) => dados.dias = dias,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Tipo Do Treino'),
                    validator: (tipo) {
                      if (tipo == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (tipo) => dados.tipodotreino = tipo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  /*  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Tipo Do Treino'),
                    validator: (tipo) {
                      if (tipo == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (tipo) => dados.tipodotreino = tipo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),*/

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Finalidade do Treino'),
                    validator: (fin) {
                      if (fin == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (fin) => dados.finalidadedotreino = fin,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'Repetições'),
                    validator: (rep) {
                      if (rep == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (rep) => dados.repeticao = rep,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //********************************************************** */

                  //********************************************************** */

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

                              dados.idAluno = alunoss.idaluno;
                              dados.idCriadordoTreino = userManager.user.id;
                              dados.iddoexercicio = userManager.user.id;

                              // userManager.criarTreino(treinos: dados)

                              //  await dados.save();

                              //  Navigator.of(context).push(ListaDeExercicioScreen(dados));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ListaDeExercicioScreen(dados)),
                              );

                              //    Navigator.of(context).pushNamed(
                              //     '/novotreinoselecionarexercicio',
                              //     arguments: dados);

                              //  PartesdoCorpoScreen

                              // showAlertDialog(context);
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
                          child: Text('Selecione o Exercicio do Treino',
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
}
