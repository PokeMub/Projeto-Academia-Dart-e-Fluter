import 'package:flutter/material.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/models/exercicios_manager.dart';
import 'package:lojavirtual/models/treinos.dart';
import 'package:lojavirtual/screens/exercicios/components/exercicios_list_treino.dart';
import 'package:lojavirtual/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class ListaDeExercicioScreen extends StatelessWidget {
  ListaDeExercicioScreen(this.trein);

  final Treinos trein;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ExerciciosManager>(
          builder: (_, exerciciosManager, __) {
            if (exerciciosManager.search.isEmpty) {
              return const Text('Selecione o Exercicio');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchDialog(exerciciosManager.search));
                      if (search != null) {
                        exerciciosManager.search = search;
                      }
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          exerciciosManager.search,
                          textAlign: TextAlign.center,
                        )),
                  );
                },
              );
            }
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Consumer<ExerciciosManager>(
            builder: (_, exerciciosManager, __) {
              if (exerciciosManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(exerciciosManager.search));
                    if (search != null) {
                      exerciciosManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    exerciciosManager.search = '';
                  },
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<ExerciciosManager>(
        builder: (_, exerciciosManager, __) {
          final filteredProducts = exerciciosManager.filteredProducts;
          if (exerciciosManager.filteredProducts.isEmpty) {
            return EmptyCard(
              title: 'Nenhum Resultado Foi Encontrada!',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: filteredProducts.length,
              itemBuilder: (_, index) {
                return ExerciciosListTileExercicios(
                    trein, filteredProducts[index]);
              });
        },
      ),
    );
  }
}
