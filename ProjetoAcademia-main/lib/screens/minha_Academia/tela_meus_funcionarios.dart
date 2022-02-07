import 'package:flutter/material.dart';
import 'package:lojavirtual/models/professor_funcionario.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class TelaFuncionarios extends StatelessWidget {
  const TelaFuncionarios(this.dadoss);

  final ProfessorFuncionario dadoss;

  @override
  Widget build(BuildContext context) {
    double tamanho = (MediaQuery.of(context).size.height * 0.04) / 2;
    double tamanhos = (MediaQuery.of(context).size.height * 0.04) * 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${dadoss.name}'),
      ),
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
                        ' Nome: ${dadoss.name} ',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        ' Telefone: ${dadoss.telefone} ',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        ' Descrição do Trabalho: ${dadoss.descricaodotrabalho}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        ' Dias de Trabalho: ${dadoss.diasdasemana} ',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        ' Horas de Trabalho: ${dadoss.horaspordia} ',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Text(
                        ' Salario: ${dadoss.salario}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanhos),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
