import 'package:flutter/material.dart';
import 'package:lojavirtual/models/dados_alunos.dart';

class OrderTiles extends StatelessWidget {
  const OrderTiles(this.dadoss);

  final ColetadeDadosdoAluno dadoss;

  @override
  Widget build(BuildContext context) {
    DateTime data = dadoss.date.toDate();
    // var date = new DateTime.fromMicrosecondsSinceEpoch(dadoss);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/resultadoperfil', arguments: dadoss);
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
                      'Data: ${data.day}/${data.month}/${data.year}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'IMC: ${dadoss.imc}',
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
