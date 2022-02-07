import 'package:flutter/material.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/models/dados_alunos_manager.dart';
import 'package:lojavirtual/models/professor_funcionario_manager.dart';
import 'package:lojavirtual/screens/minha_Academia/components/order_tiles_funcionario.dart';
import 'package:lojavirtual/screens/resultados_alunos/components/ordertiles.dart';
import 'package:provider/provider.dart';

class FuncionarioMinhaacademiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionarios'),
        centerTitle: true,
      ),
      body: Consumer<ProfessorFuncionarioManager>(
        builder: (_, professorFuncionarioManager, __) {
          if (professorFuncionarioManager
              .professorfuncionarioacademia.isEmpty) {
            return EmptyCard(
              title: 'Nenhum Resultado Foi Encontrada!',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              itemCount: professorFuncionarioManager
                  .professorfuncionarioacademia.length,
              itemBuilder: (_, index) {
                return OrderTilesFuncionario(professorFuncionarioManager
                    .professorfuncionarioacademia
                    .toList()[index]);
              });
        },
      ),
    );
  }
}
