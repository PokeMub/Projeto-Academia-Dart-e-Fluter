import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/models/proposta_donoacademia.dart';
import 'package:lojavirtual/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

import 'ordertilespropostas.dart';

class ListPropostasAcademiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<PropostasAcademiaManager>(
          builder: (_, propostasAcademiaManager, __) {
            if (propostasAcademiaManager.search.isEmpty) {
              return const Text('Propostas');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchDialog(propostasAcademiaManager.search));
                      if (search != null) {
                        propostasAcademiaManager.search = search;
                      }
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          propostasAcademiaManager.search,
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
          Consumer<PropostasAcademiaManager>(
            builder: (_, propostasAcademiaManager, __) {
              if (propostasAcademiaManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) =>
                            SearchDialog(propostasAcademiaManager.search));
                    if (search != null) {
                      propostasAcademiaManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    propostasAcademiaManager.search = '';
                  },
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<PropostasAcademiaManager>(
        builder: (_, propostasAcademiaManager, __) {
          final filteredProducts = propostasAcademiaManager.filteredProducts;
          if (propostasAcademiaManager.filteredProducts.isEmpty) {
            return EmptyCard(
              title: 'Nenhuma Proposta Foi Encontrada!',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: filteredProducts.length,
              itemBuilder: (_, index) {
                return OrderTilesPropostas(filteredProducts[index]);
              });
        },
      ),
    );
  }
}
