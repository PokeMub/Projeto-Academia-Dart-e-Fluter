import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class MinhaAcademiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double tamanho = (MediaQuery.of(context).size.height * 0.04) / 2;
    double tamanhos = (MediaQuery.of(context).size.height * 0.04) * 2;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Minha Academia'),
      ),

      /*  appBar: AppBar(
        centerTitle: true,
        title: Text('Minha Academia'),
        actions: <Widget>[
          Consumer<UserManager>(
            builder: (_, userManager, __) {
              if (userManager.adminEnabled ||
                  userManager.personalProfessorEnabled) {
                return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/edit_product',
                        arguments: userManager.minhaAcademia);
                  },
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),*/

      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        'Nome da Academia : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        userManager.minhaAcademia.nameAcademy,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: AutoSizeText(
                        "${userManager.minhaAcademia.bibiografiaAcademy}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        minFontSize: 15,
                        maxLines: null),
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        'Planos :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        'Plano 1 : ${userManager.minhaAcademia.qtdplanoumAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Periodo : ${userManager.minhaAcademia.periodoplanoumAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    'Instrutor : ${userManager.minhaAcademia.intrutorplanoumAcademy}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'Valor : R\$ ${userManager.minhaAcademia.planoumvalorAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        'Plano 2 : ${userManager.minhaAcademia.qtdplanodoisAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Periodo : ${userManager.minhaAcademia.periodoplanodoisAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    'Instrutor : ${userManager.minhaAcademia.intrutorplanodoisAcademy}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'Valor : R\$ ${userManager.minhaAcademia.planodoisvalorAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        'Plano 3 : ${userManager.minhaAcademia.qtdplanotresAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Periodo : ${userManager.minhaAcademia.periodoplanotresAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    'Instrutor : ${userManager.minhaAcademia.intrutorplanotresAcademy}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'Valor : R\$ ${userManager.minhaAcademia.planotresvalorAcademy}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanhos),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/minhaacademialistfuncionarios',
                            );
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Meus Funcionarios',
                              style: const TextStyle(fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/edit_product',
                                arguments: userManager.minhaAcademia);
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Editar Academia',
                              style: const TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
