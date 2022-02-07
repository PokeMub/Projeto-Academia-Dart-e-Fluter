import 'package:flutter/material.dart';
import 'package:lojavirtual/models/exercicio.dart';
import 'package:lojavirtual/models/treinos.dart';
import 'package:lojavirtual/screens/exercicios/selecionar_exercicios/teladeexercicio_treino.dart';

class ExerciciosListTileExercicios extends StatelessWidget {
  const ExerciciosListTileExercicios(this.treino, this.exercicio);

  final Exercicio exercicio;
  final Treinos treino;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  Navigator.of(context)
        // .pushNamed('/selecionartreinoexercicio', arguments: exercicio);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TelaApresetacaodoExercicioeTreinoScreen(exercicio, treino)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      exercicio.nameExercicio,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      exercicio.explicacaocurta,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
