import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/models/proposta_professor_manager.dart';
import 'package:lojavirtual/screens/minhaspropostas/ordertilespropostas.dart';
import 'package:lojavirtual/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class ListPropostasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<PropostasManager>(
          builder: (_, propostasManager, __) {
            if (propostasManager.search.isEmpty) {
              return const Text('Propostas');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchDialog(propostasManager.search));
                      if (search != null) {
                        propostasManager.search = search;
                      }
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          propostasManager.search,
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
          Consumer<PropostasManager>(
            builder: (_, propostasManager, __) {
              if (propostasManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(propostasManager.search));
                    if (search != null) {
                      propostasManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    propostasManager.search = '';
                  },
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<PropostasManager>(
        builder: (_, propostasManager, __) {
          final filteredProducts = propostasManager.filteredProducts;
          if (propostasManager.filteredProducts.isEmpty) {
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
