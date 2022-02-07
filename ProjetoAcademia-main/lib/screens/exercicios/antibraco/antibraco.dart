import 'package:flutter/material.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/antibraco_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/exercicios_list_tile.dart';
import 'package:lojavirtual/screens/exercicios/criarexercicio.dart';
import 'package:lojavirtual/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class ListaDeAntiBracoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<AntibracoManager>(
          builder: (_, antibracoManager, __) {
            if (antibracoManager.search.isEmpty) {
              return const Text('Exercicios De AntiBraço');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchDialog(antibracoManager.search));
                      if (search != null) {
                        antibracoManager.search = search;
                      }
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          antibracoManager.search,
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
          Consumer<AntibracoManager>(
            builder: (_, antibracoManager, __) {
              if (antibracoManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(antibracoManager.search));
                    if (search != null) {
                      antibracoManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    antibracoManager.search = '';
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CriarExercicio(5)),
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
      body: Consumer<AntibracoManager>(
        builder: (_, antibracoManager, __) {
          final filteredProducts = antibracoManager.filteredProducts;
          if (antibracoManager.filteredProducts.isEmpty) {
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
