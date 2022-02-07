import 'package:flutter/material.dart';
import 'package:lojavirtual/models/professor.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class NovocurriculoProfessor extends StatelessWidget {
  NovocurriculoProfessor(this.cargo);

  final int cargo;

  final Professor prof = Professor();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Criar Curriculo'),
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
                  if (cargo == 1) ...[
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: ' Digite seu Numero CREF '),
                      validator: (name) {
                        if (name == null) return 'Inválido';
                        return null;
                      },
                      onChanged: (name) => prof.cref = name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],

                  //********************************************************** */

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Numero Do Telefone para Contato'),
                    validator: (corpo) {
                      if (corpo == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (corpo) => prof.telefone = corpo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Descrição do Seu Trabalho'),
                    validator: (objetivo) {
                      if (objetivo == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (objetivo) => prof.descricao = objetivo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Digite Seu Estado'),
                    validator: (explicacao) {
                      if (explicacao == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (explicacao) => prof.estado = explicacao,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration:
                        const InputDecoration(labelText: 'Digite Sua Cidade'),
                    validator: (explicacaol) {
                      if (explicacaol == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (explicacaol) => prof.cidade = explicacaol,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                        labelText: 'Link do Seu Instagram para Contato'),
                    validator: (youtube) {
                      if (youtube == null) return 'Inválido';
                      return null;
                    },
                    onChanged: (youtube) => prof.instagram = youtube,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  if (cargo == 1) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Prenchar a baixo se Deseja Trabalhar em Academia.\n(Caso não deseja, deixem em Branco)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Horario Disponivel para Trabalhar'),
                      /*  validator: (hora) {
                      return null;
                    },*/
                      onChanged: (hora) => prof.horariodisponivel = hora,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Dias da Semana Disponivel'),
                      /* validator: (dias) {
                      return null;
                    },*/
                      onChanged: (dias) => prof.diasdasemanadisponivel = dias,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Media Salarial Desejada'),
                      /* validator: (media) {
                      return null;
                    },*/
                      onChanged: (media) => prof.mediasalarial = media,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Prenchar a baixo se Deseja Trabalhar como Personal Privado, Atendendo alunos online, Fazendo Treinos e Acompanhando Rendimento de cada um.\n(Caso não deseja, deixem em Branco)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Digite a Descrição do Plano 1'),
                      /* validator: (descricao1) {
                      return null;
                    },*/
                      onChanged: (descricao1) => prof.descricaoum = descricao1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Digite o Valor do Plano 1',
                          prefixText: 'R\$'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      /*  validator: (price1) {
                      return null;
                    },*/
                      onChanged: (price1) => prof.valorum = price1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //////////////////////////////////////////////////////////
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Digite a Descrição do Plano 2'),
                      /*  validator: (descricao2) {
                      return null;
                    },*/
                      onChanged: (descricao2) =>
                          prof.descricaodois = descricao2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Digite o Valor do Plano 2',
                          prefixText: 'R\$'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      /*  validator: (price2) {
                      return null;
                    },*/
                      onChanged: (price2) => prof.valordois = price2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /////////////////////////////////////////////////////////////
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Digite a Descrição do Plano 3'),
                      /* validator: (descricao3) {
                      return null;
                    },*/
                      onChanged: (descricao3) =>
                          prof.descricaotres = descricao3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                          labelText: 'Digite o Valor do Plano 3',
                          prefixText: 'R\$'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      /*  validator: (price3) {
                      return null;
                    },*/
                      onChanged: (price3) => prof.valortres = price3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],

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

                              prof.userid = userManager.user.id;
                              prof.name = userManager.user.name;
                              prof.sexo = userManager.user.sexo;
                              prof.idade = userManager.user.datadenascimento;
                              prof.online = true;
                              prof.nota = 0;

                              await prof.save();

                              showAlertDialog(context);
                            }
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Criar Curriculo',
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
      title: Text("Curriculo"),
      content: Text("Curriculo Cadastrado com Sucesso."),
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
