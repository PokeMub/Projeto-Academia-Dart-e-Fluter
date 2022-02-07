import 'package:flutter/material.dart';
import 'package:lojavirtual/models/dados_alunos.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class ResultadosAlunos extends StatelessWidget {
  const ResultadosAlunos(this.dadoss);

  final ColetadeDadosdoAluno dadoss;

  @override
  Widget build(BuildContext context) {
    double tamanho = (MediaQuery.of(context).size.height * 0.04) / 2;
    double tamanhos = (MediaQuery.of(context).size.height * 0.04) * 2;

    DateTime data = dadoss.date.toDate();
    // double alturatela = MediaQuery.of(context).size.width / 10;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${data.day}/${data.month}/${data.year}'),
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
                        ' Peso: ${dadoss.peso} ',
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
                        ' Tamanho: ${dadoss.altura} ',
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
                        ' IMC: ${dadoss.imc}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho + 3),
                  Row(
                    children: [
                      Text(
                        ' Dobras Cutâneas Pollock',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho + 3),
                  Row(
                    children: [
                      Text(
                        ' Trícipes: ${dadoss.tricipe} ',
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
                        ' Subescapular: ${dadoss.subscapular} ',
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
                        ' Bíceps: ${dadoss.bicipes}',
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
                        ' Axiliar Médial: ${dadoss.axilarmedia}',
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
                        ' Torácica ou Peitoral: ${dadoss.toracica}',
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
                        ' Supra Ilíaca: ${dadoss.suprailiaca}',
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
                        ' Supra Espinal: ${dadoss.supraespinal}',
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
                        ' Coxa: ${dadoss.coxa}',
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
                        ' Panturrilha Médial: ${dadoss.panturilha}',
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
