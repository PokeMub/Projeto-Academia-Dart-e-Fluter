import 'package:flutter/material.dart';
import 'package:lojavirtual/models/alunos.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class PerfilAluno extends StatelessWidget {
  PerfilAluno(this.alunoss);

  final Alunos alunoss;

  @override
  Widget build(BuildContext context) {
    double tamanho = (MediaQuery.of(context).size.height * 0.04) / 2;
    double tamanhos = (MediaQuery.of(context).size.height * 0.04) * 2;
    final primaryColor = Theme.of(context).primaryColor;

    DateTime data = alunoss.date.toDate();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${alunoss.name}'),
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
                      Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                      Text(
                        'Name : ${alunoss.name}',
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: tamanho),
                  Row(
                    children: [
                      Icon(Icons.cake, color: Colors.white),
                      Text(
                        ' Data de Nascimento: ${alunoss.idade} ',
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
                      Icon(Icons.face_sharp, color: Colors.white),
                      Text(
                        ' Sexo: ${alunoss.genero} ',
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
                      Icon(Icons.bloodtype, color: Colors.white),
                      Text(
                        ' Tipo Sanguíneo: ${alunoss.tiposanguinio} ',
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
                        ' Plano Escolhido: ${alunoss.plano} ',
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
                        ' Valor do Plano: ${alunoss.valordoplano} ',
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
                        ' Data que Adquiriu o Plano: ${data.day}/${data.month}/${data.year}',
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
                        ' Hora: ${data.hour}:${data.minute}:${data.second}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
                            Navigator.of(context)
                                .pushNamed('/novotreino', arguments: alunoss);
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Adicionar Treino',
                              style: const TextStyle(fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                        height: 44,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                '/coletadedadosaluno',
                                arguments: alunoss);
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('Coletas de Dados',
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
