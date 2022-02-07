import 'package:flutter/material.dart';
import 'package:lojavirtual/models/proposta_professor.dart';
import 'package:lojavirtual/screens/minhaspropostas/telaapresentacaopropostas.dart';

class OrderTilesPropostas extends StatelessWidget {
  const OrderTilesPropostas(this.proposta);

  final PropostaDeTrabalhoProfessor proposta;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TelaApresentacaoPropostas(proposta)),
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
                      'Academia ${proposta.nameAcademy}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Salario Proposto R\$ ${proposta.salarioPropostoAcademia}',
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
