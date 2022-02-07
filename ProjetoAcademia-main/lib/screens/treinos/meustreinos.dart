import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/ordertiles_aluno.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/screens/exercicios/components/treino_manager.dart';
import 'package:lojavirtual/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class TreinosAlunoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<TreinoManager>(
          builder: (_, treinoManager, __) {
            if (treinoManager.search.isEmpty) {
              return const Text('Meus Treinos');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(treinoManager.search));
                      if (search != null) {
                        treinoManager.search = search;
                      }
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          treinoManager.search,
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
          Consumer<TreinoManager>(
            builder: (_, treinoManager, __) {
              if (treinoManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(treinoManager.search));
                    if (search != null) {
                      treinoManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    treinoManager.search = '';
                  },
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<TreinoManager>(
        builder: (_, treinoManager, __) {
          final filteredProducts = treinoManager.filteredProducts;
          if (treinoManager.filteredProducts.isEmpty) {
            return EmptyCard(
              title: 'Nenhum Treino Foi Encontrada!',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: filteredProducts.length,
              itemBuilder: (_, index) {
                return OrderTilesAluno(filteredProducts[index]);
              });
        },
      ),
    );
  }
}
