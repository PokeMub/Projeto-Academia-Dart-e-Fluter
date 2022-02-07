import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/models/academia.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/cadastro/criaracademia.dois.dart';
import 'package:provider/provider.dart';

class CriarAcademiaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CriarAcademiaScreens();
  }
}

class CriarAcademiaScreens extends State<CriarAcademiaScreen> {
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
                          Center(
                            child: Text(
                              " Dados Basicos",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: tamanho),

                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Digite Nome da Academia'),
                        //   enabled: !userManager.loading,
                        validator: (name) {
                          if (name.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (name) => academiacriar.nameAcademy = name,
                      ),
                      SizedBox(height: tamanho),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CnpjInputFormatter(),
                        ],
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'CNPJ'),
                        //   enabled: !userManager.loading,
                        validator: (cnpj) {
                          if (cnpj.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (cnpj) => academiacriar.cNPJAcademy = cnpj,
                      ),
                      SizedBox(height: tamanho),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Telefone da Academia'),
                        //   enabled: !userManager.loading,
                        validator: (tel) {
                          if (tel.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (tel) => academiacriar.telefoneAcademy = tel,
                      ),

                      SizedBox(height: tamanho),

                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Digite A Bibiografia da Academia'),
                        //  enabled: !userManager.loading,
                        validator: (bibiografia) {
                          if (bibiografia.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (bibiografia) =>
                            academiacriar.bibiografiaAcademy = bibiografia,
                      ),
                      SizedBox(height: tamanho),
                      Row(
                        children: [
                          Text(
                            "* Faça sua Bibiografia da sua academia bem detalhada",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // ),
                        ],
                      ),

/*
                      Row(
                        children: [
                          Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          Center(
                            child: Text(
                              " Endereço",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
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
                            hintText: 'Digite O CEP da Academia'),
                        enabled: !userManager.loading,
                        validator: (cep) {
                          if (cep.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (cep) => academiacriar.cepAcademy = cep,
                      ),

                      SizedBox(height: tamanho),

                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Nº/Lote/Apto/Casa'),
                        enabled: !userManager.loading,
                        validator: (n) {
                          if (n.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (n) => academiacriar.numeroCepAcademy = n,
                      ),

                      SizedBox(height: tamanho),

                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Complemento/Referencia'),
                        enabled: !userManager.loading,
                        onSaved: (complemento) =>
                            academiacriar.complementoreferencia = complemento,
                      ),

                      SizedBox(height: tamanho),

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
                      SizedBox(height: tamanho / 2),

                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Plano de Academia  1'),
                        enabled: !userManager.loading,
                        validator: (planoum) {
                          if (planoum.isEmpty) return 'Campo obrigatório';
                          return null;
                        },
                        onSaved: (planoum) =>
                            academiacriar.planoumAcademy = planoum,
                      ),
                      SizedBox(height: tamanho),
                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Plano de Academia  2'),
                        enabled: !userManager.loading,
                        onSaved: (planodois) =>
                            academiacriar.planodoisAcademy = planodois,
                      ),
                      SizedBox(height: tamanho),
                      TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            hintText: 'Plano de Academia  3'),
                        onSaved: (planotres) =>
                            academiacriar.planotresAcademy = planotres,
                      ),
                      SizedBox(height: tamanho),

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
                      */

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

                              // //  userManager.createAcademy(
                              //     useracademias: academiacriar,

                              /*
                                  onSuccess: () {
                                    Fluttertoast.showToast(
                                        msg: 'Dados Atualizados com Successo');
                                    //  Navigator.of(context).pop();
                                  },
                                  onFail: (e) {
                                    Fluttertoast.showToast(
                                        msg: 'Falha ao Atualizar Dados !!!');
                                  }*/
                              //     );
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CriarAcademiadoisScreen()),
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
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
