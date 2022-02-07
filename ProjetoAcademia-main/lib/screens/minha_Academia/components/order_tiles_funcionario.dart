import 'package:flutter/material.dart';
import 'package:lojavirtual/models/dados_alunos.dart';
import 'package:lojavirtual/models/professor_funcionario.dart';

class OrderTilesFuncionario extends StatelessWidget {
  const OrderTilesFuncionario(this.dadoss);

  final ProfessorFuncionario dadoss;

  @override
  Widget build(BuildContext context) {
    //DateTime data = dadoss.date.toDate();
    // var date = new DateTime.fromMicrosecondsSinceEpoch(dadoss);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/meusfuncionarios', arguments: dadoss);
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
                      dadoss.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      dadoss.telefone,
                      style: TextStyle(
                        fontSize: 18,
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
