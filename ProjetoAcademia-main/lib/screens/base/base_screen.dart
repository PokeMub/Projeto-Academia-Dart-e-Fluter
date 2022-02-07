import 'package:flutter/material.dart';
import 'package:lojavirtual/models/page_manager.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/Cadastro/atualizarcadastro.dart';
import 'package:lojavirtual/screens/admin/admin.users.dart';
import 'package:lojavirtual/screens/cadastro/alterarcargo.dart';
import 'package:lojavirtual/screens/carteira/carteira.dart';
import 'package:lojavirtual/screens/inicio/inicio.dart';
import 'package:lojavirtual/screens/minhaspropostas/propostas.dart';
import 'package:lojavirtual/screens/minhaspropostas/propostas_academia.dart';
import 'package:lojavirtual/screens/perfil/perfilScreen.dart';
import 'package:lojavirtual/screens/premium/premium.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              InicioScreen(),
              ProfileScreen(),
              CarteiraScreen(),
              PremiumScreen(),
              if (userManager.academicEnabled) ...[
                ListPropostasAcademiaScreen(),
              ],
              if (userManager.personalProfessorEnabled) ...[
                ListPropostasScreen(),
              ],
              if (!userManager.personalProfessorEnabled &&
                  !userManager.academicEnabled) ...[
                ListPropostasScreen(),
              ],
              Alterarcargo(),
              AtualizarCadastro(),
              if (userManager.adminEnabled) ...[
                AdminUsersScreen(),
              ]
            ],
          );
        },
      ),
    );
  }
}
