import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lojavirtual/models/academia.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';
import 'package:provider/provider.dart';

class CriarAcademiaquatroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CriarAcademiaquatroScreens();
  }
}

class CriarAcademiaquatroScreens extends State<CriarAcademiaquatroScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserAcademia academiacriar = UserAcademia();

  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    //double tamanho = MediaQuery.of(context).size.height * 0.04;
    double tamanho = 18;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Criar Academia'),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey,
                child: Consumer<UserManager>(builder: (_, userManager, __) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: <Widget>[
                      //   if (userManager.user.cpf == null) ...[

                      Row(
                        children: [
                          Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          Text(
                            "Divulgação",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho / 2),
                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Link do Instagram'),
                        enabled: !userManager.loading,
                        onSaved: (linkinstagram) =>
                            academiacriar.linkInstagramAcademy = linkinstagram,
                      ),
                      SizedBox(height: tamanho),
                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Link do Youtube'),
                        enabled: !userManager.loading,
                        onSaved: (linkyoutube) =>
                            academiacriar.linkYoutubeAcademy = linkyoutube,
                      ),
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            "* Links não Obrigatório",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

//88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

                      SizedBox(height: tamanho),
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

                              academiacriar.bibiografiaAcademy =
                                  userManager.userdaacademia.bibiografiaAcademy;

                              academiacriar.cepAcademy =
                                  userManager.userdaacademia.cepAcademy;

                              academiacriar.numeroCepAcademy =
                                  userManager.userdaacademia.numeroCepAcademy;

                              academiacriar.complementoreferencia = userManager
                                  .userdaacademia.complementoreferencia;

                              ///////////////////////////////

                              academiacriar.planoumnameAcademy =
                                  userManager.userdaacademia.planoumnameAcademy;

                              academiacriar.qtdplanoumAcademy =
                                  userManager.userdaacademia.qtdplanoumAcademy;

                              academiacriar.periodoplanoumAcademy = userManager
                                  .userdaacademia.periodoplanoumAcademy;

                              academiacriar.intrutorplanoumAcademy = userManager
                                  .userdaacademia.intrutorplanoumAcademy;

                              academiacriar.planodoisnameAcademy = userManager
                                  .userdaacademia.planodoisnameAcademy;

                              academiacriar.qtdplanodoisAcademy = userManager
                                  .userdaacademia.qtdplanodoisAcademy;

                              academiacriar.periodoplanodoisAcademy =
                                  userManager
                                      .userdaacademia.periodoplanodoisAcademy;

                              academiacriar.intrutorplanodoisAcademy =
                                  userManager
                                      .userdaacademia.intrutorplanodoisAcademy;

                              academiacriar.planoumvalorAcademy = userManager
                                  .userdaacademia.planoumvalorAcademy;

                              academiacriar.planodoisvalorAcademy = userManager
                                  .userdaacademia.planodoisvalorAcademy;

                              academiacriar.planotresvalorAcademy = userManager
                                  .userdaacademia.planotresvalorAcademy;
                              /////////////////////////////////////

                              academiacriar.planotresnameAcademy = userManager
                                  .userdaacademia.planotresnameAcademy;

                              academiacriar.qtdplanotresAcademy = userManager
                                  .userdaacademia.qtdplanotresAcademy;

                              academiacriar.periodoplanotresAcademy =
                                  userManager
                                      .userdaacademia.periodoplanotresAcademy;

                              academiacriar.intrutorplanotresAcademy =
                                  userManager
                                      .userdaacademia.intrutorplanotresAcademy;

                              ////  academiacriar.images.map((e) =>
                              // 'https://www12.senado.leg.br/radio/1/projetos-da-semana/2021/09/24/projetos-concede-deducao-no-ir-para-gastos-com-academia-e-atividades-fisicas/@@images/3f757a2d-06f5-4791-9044-af2e5eba903f.jpeg');

                              //  academiacriar.images.first =
                              //    'https://www12.senado.leg.br/radio/1/projetos-da-semana/2021/09/24/projetos-concede-deducao-no-ir-para-gastos-com-academia-e-atividades-fisicas/@@images/3f757a2d-06f5-4791-9044-af2e5eba903f.jpeg';

                              userManager.atualizardataAcademy(
                                  useracademias: academiacriar,
                                  onSuccess: () {
                                    Fluttertoast.showToast(
                                        msg: 'Dados Atualizados com Successo');
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => BaseScreen()),
                                    );
                                    //  Navigator.of(context).pop();
                                  },
                                  onFail: (e) {
                                    Fluttertoast.showToast(
                                        msg: 'Falha ao Atualizar Dados !!!');
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => BaseScreen()),
                                    );
                                  });
                            }
                          },
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text(
                                  'Próximo',
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
