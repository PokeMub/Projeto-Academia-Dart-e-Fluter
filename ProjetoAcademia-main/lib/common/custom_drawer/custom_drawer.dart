import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer_header.dart';
import 'package:lojavirtual/common/custom_drawer/drawer_tile.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                //  const Color(0xFF01579B),
                const Color(0xFF00B0FF),
                const Color(0xFFCFD8DC),
                // Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              const Divider(),
              DrawerTile(
                iconData: Icons.home,
                title: 'Início',
                page: 0,
              ),
              DrawerTile(
                iconData: Icons.person,
                title: 'Perfil',
                page: 1,
              ),
              DrawerTile(
                iconData: Icons.account_balance_wallet,
                title: 'Carteira',
                page: 2,
              ),
              DrawerTile(
                iconData: Icons.settings,
                title: 'Premium',
                page: 3,
              ),
              DrawerTile(
                iconData: Icons.messenger,
                title: 'Minhas Propostas',
                page: 4,
              ),
              DrawerTile(
                iconData: Icons.settings,
                title: 'Alterar Cargo ...',
                page: 5,
              ),
              /*
              Consumer<UserManager>(
                builder: (_, userManager, __) {
                  if ((userManager.user.cpf == null) ||
                      (userManager.user.telefone == null) ||
                      (userManager.user.tiposanguinio == null) ||
                      (userManager.user.cep == null) ||
                      (userManager.user.sexo == null) ||
                      (userManager.user.datadenascimento == null)) {
                    return Column(
                      children: <Widget>[
                        DrawerTile(
                          iconData: Icons.settings,
                          title: 'Atualizar Cadastro',
                          page: 5,
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              */

              DrawerTile(
                iconData: Icons.settings,
                title: 'Atualizar Cadastro',
                page: 6,
              ),
              Consumer<UserManager>(
                builder: (_, userManager, __) {
                  if (userManager.adminEnabled) {
                    return Column(
                      children: <Widget>[
                        const Divider(),
                        DrawerTile(
                          iconData: Icons.settings,
                          title: 'Usuários Registrados',
                          page: 7,
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
