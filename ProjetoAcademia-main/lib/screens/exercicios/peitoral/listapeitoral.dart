import 'package:flutter/material.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/exercicios_list_tile.dart';
import 'package:lojavirtual/screens/exercicios/components/peitoral_manager.dart';
import 'package:lojavirtual/screens/exercicios/criarexercicio.dart';
import 'package:lojavirtual/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class ListaDePeitoralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<PeitoralManager>(
          builder: (_, peitoralManager, __) {
            if (peitoralManager.search.isEmpty) {
              return const Text('Exercicios De Peitoral');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(peitoralManager.search));
                      if (search != null) {
                        peitoralManager.search = search;
                      }
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          peitoralManager.search,
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
          Consumer<PeitoralManager>(
            builder: (_, peitoralManager, __) {
              if (peitoralManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(peitoralManager.search));
                    if (search != null) {
                      peitoralManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    peitoralManager.search = '';
                  },
                );
              }
            },
          ),
          Consumer<UserManager>(
            builder: (_, userManager, __) {
              if (userManager.adminEnabled ||
                  userManager.donodeAcademiaEnabled ||
                  userManager.universitarioEnabled) {
                return IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    //  Navigator.of(context).pushNamed('/criarexercicio', arguments: codigo);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CriarExercicio(1)),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      body: Consumer<PeitoralManager>(
        builder: (_, peitoralManager, __) {
          final filteredProducts = peitoralManager.filteredProducts;
          if (peitoralManager.filteredProducts.isEmpty) {
            return EmptyCard(
              title: 'Nenhum Resultado Foi Encontrada!',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: filteredProducts.length,
              itemBuilder: (_, index) {
                return ExerciciosListTile(filteredProducts[index]);
              });
        },
      ),
    );
  }
}
