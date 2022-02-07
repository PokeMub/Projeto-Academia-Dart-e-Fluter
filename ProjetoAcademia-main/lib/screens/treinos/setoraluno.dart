import 'package:flutter/material.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/common/order_tile.dart';
import 'package:lojavirtual/models/alunos_manager.dart';
import 'package:provider/provider.dart';

class TreinosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setor Alunos'),
        centerTitle: true,
      ),
      body: Consumer<AlunosManager>(
        builder: (_, alunosManager, __) {
          if (alunosManager.listaalunos.isEmpty) {
            return EmptyCard(
              title: 'Nenhum Aluno Foi encontrada!',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              itemCount: alunosManager.listaalunos.length,
              itemBuilder: (_, index) {
                return OrderTile(alunosManager.listaalunos.toList()[index]);
              });
        },
      ),
    );
  }
}
