import 'package:flutter/material.dart';
import 'package:lojavirtual/common/empty_card.dart';
import 'package:lojavirtual/models/professor_manager.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/products/components/search_dialog.dart';
import 'package:lojavirtual/screens/professor/novocurriculopersonal.dart';
import 'package:provider/provider.dart';

import 'components/ordestiles.dart';

class ProfessorDisponiveisScreen extends StatelessWidget {
  ProfessorDisponiveisScreen(this.cargo);

  final int cargo;
  @override
  Widget build(BuildContext context) {
    String text = '';
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ProfessorManager>(
          builder: (_, professorManager, __) {
            if (cargo == 1) {
              text = 'Professores Disponíveis';
              // return const Text('Professores Disponíveis');
            }
            if (cargo == 3) {
              text = 'Estagiarios Disponiveis';
            }

            if (professorManager.search.isEmpty) {
              return Text(text);

              //  return const Text('Professores Disponíveis');
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchDialog(professorManager.search));
                      if (search != null) {
                        professorManager.search = search;
                      }
                    },
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          professorManager.search,
                          textAlign: TextAlign.center,
                        )),
                  );
                },
              );
            }

            //  }

            /////////
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Consumer<ProfessorManager>(
            builder: (_, professorManager, __) {
              if (professorManager.search.isEmpty) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(professorManager.search));
                    if (search != null) {
                      professorManager.search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    professorManager.search = '';
                  },
                );
              }
            },
          ),
          Consumer<UserManager>(
            builder: (_, userManager, __) {
              if (userManager.adminEnabled ||
                  userManager.personalProfessorEnabled ||
                  userManager.universitarioEnabled) {
                return IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NovocurriculoProfessor(cargo)),
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
      body: Consumer<ProfessorManager>(
        builder: (_, professorManager, __) {
          final filteredProducts = professorManager.filteredProducts;
          if (professorManager.filteredProducts.isEmpty) {
            return EmptyCard(
              title: 'Nenhum Funcionario Foi Encontrado!',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: filteredProducts.length,
              itemBuilder: (_, index) {
                return OrderTilesprofessor(cargo, filteredProducts[index]);
              });
        },
      ),
    );
  }
}
