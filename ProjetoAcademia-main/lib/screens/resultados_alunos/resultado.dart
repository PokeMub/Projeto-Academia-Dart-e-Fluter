import 'package:flutter/material.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/models/dados_alunos_manager.dart';
import 'package:lojavirtual/screens/resultados_alunos/components/ordertiles.dart';
import 'package:provider/provider.dart';

class ResultadoAlunoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados Alunos'),
        centerTitle: true,
      ),
      body: Consumer<AlunosDadosManager>(
        builder: (_, alunosDadosManager, __) {
          if (alunosDadosManager.alunosdados.isEmpty) {
            return EmptyCard(
              title: 'Nenhum Resultado Foi Encontrada!',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              itemCount: alunosDadosManager.alunosdados.length,
              itemBuilder: (_, index) {
                return OrderTiles(
                    alunosDadosManager.alunosdados.toList()[index]);
              });
        },
      ),
    );
  }
}
