import 'package:flutter/material.dart';
import 'package:lojavirtual/models/professor.dart';

import '../telaapresentacaoprofessor.dart';

class OrderTilesprofessor extends StatelessWidget {
  const OrderTilesprofessor(this.cargo, this.prof);

  final Professor prof;
  final int cargo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //   .pushNamed('/teladetreinoalunos', arguments: meustreinos);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TelaCurriculoProfessor(cargo, prof)));
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
                      prof.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      prof.cidade,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Avaliação: ${prof.nota}',
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
