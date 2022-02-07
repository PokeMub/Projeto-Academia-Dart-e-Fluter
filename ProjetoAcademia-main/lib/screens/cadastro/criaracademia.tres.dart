import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/models/academia.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/cadastro/criaracademia.tresdois.dart';
import 'package:provider/provider.dart';

class CriarAcademiatresScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CriarAcademiatresScreens();
  }
}

var _qtd = [
  ' 2 Vezes por Semana',
  ' 3 Vezes por Semana',
  ' 5 Vezes por Semana',
  ' Todos os Dias',
  ' Selecione Quantidades de dias'
];
var qtdSelecionado = ' Selecione Quantidades de dias';
String qtdvezesporsemana;

var _periodo = [
  ' Mensal',
  ' Trimestral',
  ' Semestral',
  ' Anual',
  ' Selecione o Periodo'
];
var periodoSelecionado = ' Selecione o Periodo';
String periodo;

var _instrutor = [
  ' Sem Instrutor (Personal Trainer)',
  ' Com Instrutor (Personal Trainer)',
  ' Selecione se o Plano terar Instrutor'
];
var instrutorSelecionado = ' Selecione se o Plano terar Instrutor';
String instrutor;

class CriarAcademiatresScreens extends State<CriarAcademiatresScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserAcademia academiacriar = UserAcademia();

  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    double tamanho = 18;
    double sizeboxs = 10;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Planos/Valores'),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey,
                child: Consumer<UserManager>(
                  builder: (_, userManager, __) {
                    return ListView(
                      padding: const EdgeInsets.all(16),
                      shrinkWrap: true,
                      children: <Widget>[
                        /*
                      Row(
                        children: [
                          Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          Text(
                            "Planos/Valores",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho),*/
                        Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.perm_identity,
                                color: Colors.white,
                              ),
                              Text(
                                "Plano 1",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: tamanho / 2),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.folder,
                              color: Colors.white,
                            ),
                            SizedBox(height: sizeboxs * 3),
                            DropdownButton(
                              items: _qtd
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (selectedAccountType) {
                                qtdvezesporsemana = selectedAccountType;

                                setState(() {
                                  qtdSelecionado = selectedAccountType;
                                });
                              },
                              value: qtdSelecionado,
                              isExpanded: false,
                            )
                          ],
                        ),
                        SizedBox(height: tamanho / 2),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.folder,
                              color: Colors.white,
                            ),
                            SizedBox(height: sizeboxs * 3),
                            DropdownButton(
                              items: _periodo
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (selectedAccountType) {
                                periodo = selectedAccountType;

                                setState(() {
                                  periodoSelecionado = selectedAccountType;
                                });
                              },
                              value: periodoSelecionado,
                              isExpanded: false,
                            )
                          ],
                        ),

                        SizedBox(height: tamanho / 2),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.folder,
                              color: Colors.white,
                            ),
                            SizedBox(height: sizeboxs * 3),
                            DropdownButton(
                              items: _instrutor
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (selectedAccountType) {
                                instrutor = selectedAccountType;

                                setState(() {
                                  instrutorSelecionado = selectedAccountType;
                                });
                              },
                              value: instrutorSelecionado,
                              isExpanded: false,
                            )
                          ],
                        ),
                        SizedBox(height: tamanho / 2),

                        /////////////////////////////////////////

                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            RealInputFormatter(moeda: true),
                          ],
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.credit_card,
                                color: Colors.white,
                              ),
                              hintText: 'Digite o Valor do Plano'),
                          enabled: !userManager.loading,
                          validator: (valorplano1) {
                            if (valorplano1.isEmpty) return 'Campo obrigatório';
                            return null;
                          },
                          onSaved: (valorplano1) =>
                              academiacriar.planoumvalorAcademy = valorplano1,
                        ),

                        SizedBox(height: tamanho / 2),

                        SizedBox(
                          height: 44,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            disabledColor:
                                Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed: // userManager.loading
                                // ? null
                                () async {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();

                                academiacriar.nameAcademy =
                                    userManager.userdaacademia.nameAcademy;

                                academiacriar.cNPJAcademy =
                                    userManager.userdaacademia.cNPJAcademy;

                                academiacriar.telefoneAcademy =
                                    userManager.userdaacademia.telefoneAcademy;

                                academiacriar.bibiografiaAcademy = userManager
                                    .userdaacademia.bibiografiaAcademy;

                                academiacriar.cepAcademy =
                                    userManager.userdaacademia.cepAcademy;

                                academiacriar.numeroCepAcademy =
                                    userManager.userdaacademia.numeroCepAcademy;

                                academiacriar.complementoreferencia =
                                    userManager
                                        .userdaacademia.complementoreferencia;

                                ////////////////////////////////////
                                academiacriar.planoumnameAcademy = 'Plano 1';
                                ///////////////////////////////////////////////
                                academiacriar.qtdplanoumAcademy =
                                    qtdSelecionado;
                                //////////////////////////////////////////////
                                academiacriar.periodoplanoumAcademy =
                                    periodoSelecionado;
                                //////////////////////////////////////////////////
                                if (instrutorSelecionado ==
                                    ' Sem Instrutor (Personal Trainer)') {
                                  academiacriar.intrutorplanoumAcademy = false;
                                } else {
                                  academiacriar.intrutorplanoumAcademy = true;
                                }
                                /////////////////////////////////////////////

                                userManager.atualizardataAcademy(
                                  useracademias: academiacriar,
                                );
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CriarAcademiatresdoisScreen()),
                                );
                              }
                            },
                            child: const Text(
                              'Próximo',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
