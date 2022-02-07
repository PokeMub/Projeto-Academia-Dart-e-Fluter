import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/models/admin_users_manager.dart';
import 'package:lojavirtual/models/alunos.dart';
import 'package:lojavirtual/models/alunos_manager.dart';
import 'package:lojavirtual/models/dados_alunos.dart';
import 'package:lojavirtual/models/exercicios_manager.dart';
import 'package:lojavirtual/models/product.dart';
import 'package:lojavirtual/models/product_manager.dart';
import 'package:lojavirtual/models/professor_funcionario.dart';
import 'package:lojavirtual/models/treinos.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/Cadastro/atualizarcadastro.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';
import 'package:lojavirtual/screens/edit_product/edit_product_screen.dart';
import 'package:lojavirtual/screens/exercicios/abdominal/abdominal.dart';
import 'package:lojavirtual/screens/exercicios/airobico/airobico.dart';
import 'package:lojavirtual/screens/exercicios/antibraco/antibraco.dart';
import 'package:lojavirtual/screens/exercicios/bicipes/listabicipes.dart';
import 'package:lojavirtual/screens/exercicios/components/abdominal_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/airobico_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/antibraco_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/bicipes_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/costa_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/ombro_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/peitoral_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/perna_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/trapezio_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/treino_manager.dart';
import 'package:lojavirtual/screens/exercicios/components/tricipes_manager.dart';
import 'package:lojavirtual/screens/exercicios/costas/costas.dart';
import 'package:lojavirtual/screens/exercicios/exercicios.dart';
import 'package:lojavirtual/screens/exercicios/ombro/ombro.dart';
import 'package:lojavirtual/screens/exercicios/peitoral/listapeitoral.dart';
import 'package:lojavirtual/screens/exercicios/perna/perna.dart';
import 'package:lojavirtual/screens/exercicios/selecionar_exercicios/partesdocorpo.dart';
import 'package:lojavirtual/screens/exercicios/tela_apresentacao_exercicios.dart';
import 'package:lojavirtual/screens/exercicios/trapezio/trapezio.dart';
import 'package:lojavirtual/screens/exercicios/tricipes/tricipes.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:lojavirtual/screens/minha_Academia/components/list_funcionarios.dart';
import 'package:lojavirtual/screens/minha_Academia/minha_academia.dart';
import 'package:lojavirtual/screens/minha_Academia/tela_meus_funcionarios.dart';
import 'package:lojavirtual/screens/product/product_screen.dart';
import 'package:lojavirtual/screens/resultados_alunos/resultado.dart';
import 'package:lojavirtual/screens/resultados_alunos/resultadoaluno.dart';
import 'package:lojavirtual/screens/signup/signup_screen.dart';
import 'package:lojavirtual/screens/treinos/coletagemdasinformacoesdoaluno.dart';
import 'package:lojavirtual/screens/treinos/meustreinos.dart';
import 'package:lojavirtual/screens/treinos/novotreino.dart';
import 'package:lojavirtual/screens/treinos/perfilaluno.dart';
import 'package:lojavirtual/screens/treinos/setoraluno.dart';
import 'package:lojavirtual/screens/treinos/telatreinodoaluno.dart';
import 'package:provider/provider.dart';
import 'models/dados_alunos_manager.dart';
import 'models/exercicio.dart';
import 'models/professor_funcionario_manager.dart';
import 'models/professor_manager.dart';
import 'models/proposta_donoacademia.dart';
import 'models/proposta_professor_manager.dart';

void main() {
  runApp(const MyApp());
}

int versaoatual = 12; //Atualizar Sempre
String versaoatualstring = 'Backup 24';
//String nome = 'lucas';
//splash 0
//senha 123

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => UserManager(),
                lazy: false,
              ),
              ChangeNotifierProvider(
                create: (_) => ProductManager(),
                lazy: false,
              ),
              ChangeNotifierProxyProvider<UserManager, AlunosManager>(
                create: (_) => AlunosManager(),
                lazy: false,
                update: (_, userManager, alunosManager) =>
                    alunosManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, AlunosDadosManager>(
                create: (_) => AlunosDadosManager(),
                lazy: false,
                update: (_, userManager, alunosDadosManager) =>
                    alunosDadosManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, PeitoralManager>(
                create: (_) => PeitoralManager(),
                lazy: false,
                update: (_, userManager, peitoralManager) =>
                    peitoralManager..updateUser(userManager.user),
              ),
              ////////////////////////////////////////////////////

              ChangeNotifierProxyProvider<UserManager, BicipesManager>(
                create: (_) => BicipesManager(),
                lazy: false,
                update: (_, userManager, bicipesManager) =>
                    bicipesManager..updateUser(userManager.user),
              ),

              ChangeNotifierProxyProvider<UserManager, TricipesManager>(
                create: (_) => TricipesManager(),
                lazy: false,
                update: (_, userManager, tricipesManager) =>
                    tricipesManager..updateUser(userManager.user),
              ),

              ChangeNotifierProxyProvider<UserManager, OmbroManager>(
                create: (_) => OmbroManager(),
                lazy: false,
                update: (_, userManager, ombroManager) =>
                    ombroManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, AntibracoManager>(
                create: (_) => AntibracoManager(),
                lazy: false,
                update: (_, userManager, antibracoManager) =>
                    antibracoManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, TrapezioManager>(
                create: (_) => TrapezioManager(),
                lazy: false,
                update: (_, userManager, trapezioManager) =>
                    trapezioManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, PernaManager>(
                create: (_) => PernaManager(),
                lazy: false,
                update: (_, userManager, pernaManager) =>
                    pernaManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, CostaManager>(
                create: (_) => CostaManager(),
                lazy: false,
                update: (_, userManager, costaManager) =>
                    costaManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, AirobicoManager>(
                create: (_) => AirobicoManager(),
                lazy: false,
                update: (_, userManager, airobicoManager) =>
                    airobicoManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, AbdominalManager>(
                create: (_) => AbdominalManager(),
                lazy: false,
                update: (_, userManager, abdominalManager) =>
                    abdominalManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, TreinoManager>(
                create: (_) => TreinoManager(),
                lazy: false,
                update: (_, userManager, treinoManager) =>
                    treinoManager..updateUser(userManager.user),
              ),
              ChangeNotifierProxyProvider<UserManager, ExerciciosManager>(
                create: (_) => ExerciciosManager(),
                lazy: false,
                update: (_, userManager, exerciciosManager) =>
                    exerciciosManager..updateUser(userManager.user),
              ),

              ChangeNotifierProxyProvider<UserManager, ProfessorManager>(
                create: (_) => ProfessorManager(),
                lazy: false,
                update: (_, userManager, professorManager) =>
                    professorManager..updateUser(userManager.user),
              ),

              ChangeNotifierProxyProvider<UserManager, PropostasManager>(
                create: (_) => PropostasManager(),
                lazy: false,
                update: (_, userManager, propostasManager) =>
                    propostasManager..updateUser(userManager.user),
              ),

              ChangeNotifierProxyProvider<UserManager,
                  PropostasAcademiaManager>(
                create: (_) => PropostasAcademiaManager(),
                lazy: false,
                update: (_, userManager, propostasAcademiaManager) =>
                    propostasAcademiaManager..updateUser(userManager.user),
              ),

              ChangeNotifierProxyProvider<UserManager,
                  ProfessorFuncionarioManager>(
                create: (_) => ProfessorFuncionarioManager(),
                lazy: false,
                update: (_, userManager, professorFuncionarioManager) =>
                    professorFuncionarioManager..updateUser(userManager.user),
              ),

              ////////////////////////////////////////////////////
              ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
                create: (_) => AdminUsersManager(),
                lazy: false,
                update: (_, userManager, adminUsersManager) =>
                    adminUsersManager..updateUser(userManager),
              )
            ],
            child: MaterialApp(
              title: 'Projeto Academia',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: const Color(0xFFFF8F00),
                scaffoldBackgroundColor: const Color(0xFF01579B),
                appBarTheme: const AppBarTheme(elevation: 0),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              // initialRoute: '/base',
              initialRoute: '/login',
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/atualizarcadastro':
                    return MaterialPageRoute(
                        builder: (_) => AtualizarCadastro());
                  case '/login':
                    return MaterialPageRoute(builder: (_) => LoginScreen());
                  case '/signup':
                    return MaterialPageRoute(builder: (_) => SignUpScreen());
                  case '/setoraluno':
                    return MaterialPageRoute(builder: (_) => TreinosScreen());
                  case '/product':
                    return MaterialPageRoute(
                        builder: (_) =>
                            ProductScreen(settings.arguments as Product));
                  case '/edit_product':
                    return MaterialPageRoute(
                        builder: (_) =>
                            EditProductScreen(settings.arguments as Product));
                  case '/alunoperfil':
                    return MaterialPageRoute(
                        builder: (_) =>
                            PerfilAluno(settings.arguments as Alunos));

                  case '/coletadedadosaluno':
                    return MaterialPageRoute(
                        builder: (_) => ColetagemDasinformacoesdoAluno(
                            settings.arguments as Alunos));
                  case '/dadosaluno':
                    return MaterialPageRoute(
                        builder: (_) => ResultadoAlunoScreen());
                  case '/resultadoperfil':
                    return MaterialPageRoute(
                        builder: (_) => ResultadosAlunos(
                            settings.arguments as ColetadeDadosdoAluno));
                  case '/exercicios':
                    return MaterialPageRoute(
                        builder: (_) => ExerciciosScreen());

///////////////////////////////////////////////////////////////////
                  case '/listadepeitoral':
                    return MaterialPageRoute(
                        builder: (_) => ListaDePeitoralScreen());
                  case '/listadebicipes':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeBicipesScreen());
                  case '/listadeombro':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeOmbroScreen());
                  case '/listadetricipes':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeTricipesScreen());
                  case '/listadeantibraco':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeAntiBracoScreen());
                  case '/listadetrapezio':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeTrapezioScreen());
                  case '/listadeperna':
                    return MaterialPageRoute(
                        builder: (_) => ListaDePernaScreen());
                  case '/listadecostas':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeCostasScreen());

                  case '/listadeairobico':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeAirobicoScreen());

                  case '/listadeabdominal':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeAbdominalScreen());

                  case '/apresetacaodoexercicio':
                    return MaterialPageRoute(
                        builder: (_) => TelaApresetacaoScreen(
                            settings.arguments as Exercicio));

                  case '/novotreino':
                    return MaterialPageRoute(
                        builder: (_) =>
                            NovoTreino(settings.arguments as Alunos));

                  case '/novotreinoselecionarexercicio':
                    return MaterialPageRoute(
                        builder: (_) => ListaDeExercicioScreen(
                            settings.arguments as Treinos));

                  case '/entrartelaAluno':
                    return MaterialPageRoute(
                        builder: (_) => TreinosAlunoScreen());
                  case '/teladetreinoalunos':
                    return MaterialPageRoute(
                        builder: (_) =>
                            TelaTreinoAlunos(settings.arguments as Treinos));

                  case '/minhaacademia':
                    return MaterialPageRoute(
                        builder: (_) => MinhaAcademiaScreen());
                  case '/minhaacademialistfuncionarios':
                    return MaterialPageRoute(
                        builder: (_) => FuncionarioMinhaacademiaScreen());

                  case '/meusfuncionarios':
                    return MaterialPageRoute(
                        builder: (_) => TelaFuncionarios(
                            settings.arguments as ProfessorFuncionario));

                  /* case '/selecionartreinoexercicio':
                    return MaterialPageRoute(
                        builder: (_) => TelaApresetacaodoExercicioeTreinoScreen(
                            settings.arguments as Exercicio));*/

                  //  case '/criarexercicio':
                  //   return MaterialPageRoute(
                  //     builder: (_) => CriarExercicio());

                  ////////////////////////////////////////////

                  case '/base':
                  default:
                    return MaterialPageRoute(builder: (_) => BaseScreen());
                }
              },
            ),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      body: Center(
          child: lightMode
              ? Image.asset('assets/splash.png')
              : Image.asset('assets/splash_dark.png')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}






























/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/models/admin_users_manager.dart';
import 'package:lojavirtual/models/product.dart';
import 'package:lojavirtual/models/product_manager.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/Cadastro/atualizarcadastro.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';
import 'package:lojavirtual/screens/edit_product/edit_product_screen.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:lojavirtual/screens/product/product_screen.dart';
import 'package:lojavirtual/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
// WidgetsFlutterBinding.ensureInitialized();
// SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//   overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(const MyApp());
}

int versaoatual = 1;        //Atualizar Sempre
int proximaversao = 2;      //Atualizar Sempre

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => UserManager(),
                lazy: false,
              ),
              ChangeNotifierProvider(
                create: (_) => ProductManager(),
                lazy: false,
              ),
              ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
                create: (_) => AdminUsersManager(),
                lazy: false,
                update: (_, userManager, adminUsersManager) =>
                    adminUsersManager..updateUser(userManager),
              )
            ],
            child: MaterialApp(
              title: 'Projeto Academia',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                //const Color(0xFF00B0FF),   azul claro
                //const Color(0xFFFF8F00),    LARANJA
                //const Color(0xFF01579B),    azul escuro
                //const Color(0xFFEEEEEE),    Branco:
                //const Color(0xFFCFD8DC),    CINZA :
                primaryColor: const Color(0xFFFF8F00),
                scaffoldBackgroundColor: const Color(0xFF01579B),
                appBarTheme: const AppBarTheme(elevation: 0),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),

              // initialRoute: '/login',
              initialRoute: '/base',
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/atualizarcadastro':
                    return MaterialPageRoute(
                        builder: (_) => AtualizarCadastro());
                  case '/login':
                    return MaterialPageRoute(builder: (_) => LoginScreen());
                  case '/signup':
                    return MaterialPageRoute(builder: (_) => SignUpScreen());
                  case '/product':
                    return MaterialPageRoute(
                        builder: (_) =>
                            ProductScreen(settings.arguments as Product));

                  case '/edit_product':
                    return MaterialPageRoute(
                        builder: (_) =>
                            EditProductScreen(settings.arguments as Product));

                  case '/base':
                  default:
                    return MaterialPageRoute(builder: (_) => BaseScreen());
                }
              },
            ),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      body: Center(
          child: lightMode
              ? Image.asset('assets/splash.png')
              : Image.asset('assets/splash_dark.png')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}





































/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
          create: (_) => AdminUsersManager(),
          lazy: false,
          update: (_, userManager, adminUsersManager) =>
              adminUsersManager..updateUser(userManager),
        )
      ],
      child: MaterialApp(
        title: 'Projeto Academia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // const Color(0xFF00B0FF),   azul claro
          //const Color(0xFFFF8F00),    LARANJA
          //const Color(0xFF01579B),    azul escuro
          //const Color(0xFFEEEEEE),    Branco:
          //const Color(0xFFCFD8DC),    CINZA :
          primaryColor: const Color(0xFFFF8F00),
          scaffoldBackgroundColor: const Color(0xFF01579B),
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //initialRoute: '/login',
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/atualizarcadastro':
              return MaterialPageRoute(builder: (_) => AtualizarCadastro());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}



*/


/*
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/Cadastro/atualizarcadastro.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:lojavirtual/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      lazy: false,
      child: MaterialApp(
        title: 'Projeto Academia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // const Color(0xFF00B0FF),   azul claro
          //const Color(0xFFFF8F00),    LARANJA
          //const Color(0xFF01579B),    azul escuro
          //const Color(0xFFEEEEEE),    Branco:
          //const Color(0xFFCFD8DC),    CINZA :
          primaryColor: const Color(0xFFFF8F00),
          scaffoldBackgroundColor: const Color(0xFF01579B),
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // initialRoute: '/login',
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/atualizarcadastro':
              return MaterialPageRoute(builder: (_) => AtualizarCadastro());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
*/
*/
































/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
          create: (_) => AdminUsersManager(),
          lazy: false,
          update: (_, userManager, adminUsersManager) =>
              adminUsersManager..updateUser(userManager),
        )
      ],
      child: MaterialApp(
        title: 'Projeto Academia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // const Color(0xFF00B0FF),   azul claro
          //const Color(0xFFFF8F00),    LARANJA
          //const Color(0xFF01579B),    azul escuro
          //const Color(0xFFEEEEEE),    Branco:
          //const Color(0xFFCFD8DC),    CINZA :
          primaryColor: const Color(0xFFFF8F00),
          scaffoldBackgroundColor: const Color(0xFF01579B),
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //initialRoute: '/login',
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/atualizarcadastro':
              return MaterialPageRoute(builder: (_) => AtualizarCadastro());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}



*/


/*
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/Cadastro/atualizarcadastro.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:lojavirtual/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      lazy: false,
      child: MaterialApp(
        title: 'Projeto Academia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // const Color(0xFF00B0FF),   azul claro
          //const Color(0xFFFF8F00),    LARANJA
          //const Color(0xFF01579B),    azul escuro
          //const Color(0xFFEEEEEE),    Branco:
          //const Color(0xFFCFD8DC),    CINZA :
          primaryColor: const Color(0xFFFF8F00),
          scaffoldBackgroundColor: const Color(0xFF01579B),
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // initialRoute: '/login',
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/atualizarcadastro':
              return MaterialPageRoute(builder: (_) => AtualizarCadastro());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
*/