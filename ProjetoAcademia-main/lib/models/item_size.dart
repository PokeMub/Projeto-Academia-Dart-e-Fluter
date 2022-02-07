class ItemSize {
  ItemSize(
      {this.planonameAcademy,
      this.planovalorAcademy,
      this.qtdplanoAcademy,
      this.periodoplanoAcademy,
      this.intrutorplanoAcademy});

  ItemSize.fromMap(Map<String, dynamic> map) {
    planonameAcademy = map['planonameAcademy'] as String;
    planovalorAcademy = map['planovalorAcademy'] as String;
    qtdplanoAcademy = map['qtdplanoAcademy'] as String;
    periodoplanoAcademy = map['periodoplanoAcademy'] as String;
    intrutorplanoAcademy = map['intrutorplanoAcademy'] as bool;
  }

  bool intrutorplanoAcademy;
  String periodoplanoAcademy;
  String qtdplanoAcademy;
  String planovalorAcademy;
  String planonameAcademy;

  ItemSize clone() {
    return ItemSize(
      planonameAcademy: planonameAcademy,
      planovalorAcademy: planovalorAcademy,
      qtdplanoAcademy: qtdplanoAcademy,
      periodoplanoAcademy: periodoplanoAcademy,
      intrutorplanoAcademy: intrutorplanoAcademy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'planonameAcademy': planonameAcademy,
      'planovalorAcademy': planovalorAcademy,
      'qtdplanoAcademy': qtdplanoAcademy,
      'periodoplanoAcademy': periodoplanoAcademy,
      'intrutorplanoAcademy': intrutorplanoAcademy,
    };
  }

  @override
  String toString() {
    return 'ItemSize{planoumnameAcademy: $planonameAcademy, planoumvalorAcademy: $planovalorAcademy, qtdplanoumAcademy: $qtdplanoAcademy, periodoplanoumAcademy: $periodoplanoAcademy, intrutorplanoumAcademy: $intrutorplanoAcademy}';
  }
}
