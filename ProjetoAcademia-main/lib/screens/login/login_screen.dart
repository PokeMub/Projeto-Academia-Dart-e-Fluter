import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';
import 'package:lojavirtual/main.dart';
import 'package:lojavirtual/models/user.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String ver = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, child) {
                userManager.versionprocurar(
                    onFail: (e) {
                      // ignore: deprecated_member_use
                      scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('Falha ao entrar: $e'),
                        backgroundColor: Colors.red,
                      ));
                    },
                    onSuccess: () {});
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email), hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if (!emailValid(email)) return 'E-mail inválido';
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.vpn_key), hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass) {
                        if (pass.isEmpty || pass.length < 6)
                          return 'Senha inválida';
                        return null;
                      },
                    ),
                    child,
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  String ver =
                                      userManager.version.versao_firebase;
                                  if ((userManager.version.bloquear_login ==
                                          true) ||
                                      (versaoatual <
                                          userManager.version.version)) {
                                    if ((versaoatual <
                                            userManager.version.version) &&
                                        (userManager.version.bloquear_login ==
                                            false)) {
                                      scaffoldKey.currentState
                                          // ignore: deprecated_member_use
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Seu Aplicativo está Desatualizado\nEntre Contato com o Suporte e Solicite o APP Atualizado.\nVersão do seu Aparelho : $versaoatualstring\nUltima Versão Lançada : $ver'),
                                        backgroundColor: Colors.red,
                                      ));
                                    } else if (userManager
                                            .version.bloquear_login ==
                                        true) {
                                      scaffoldKey.currentState
                                          // ignore: deprecated_member_use
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Aplicativo Bloqueado para Manutenção'),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } else {
                                    userManager.signIn(
                                        user: User(
                                            email: emailController.text,
                                            password: passController.text),
                                        onFail: (e) {
                                          scaffoldKey.currentState
                                              // ignore: deprecated_member_use
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text('Falha ao entrar: $e'),
                                            backgroundColor: Colors.red,
                                          ));
                                        },
                                        onSuccess: () {
                                          Navigator.of(context).pop();
                                        });
                                  }
                                }
                              },
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        child: userManager.loading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Text(
                                'Entrar',
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Não tem Conta ?',
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/signup');
                              },
                              child: Text(
                                ' Cadastre-se',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ))
                  ],
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Text('Esqueci minha senha'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
