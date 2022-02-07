import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class ExerciciosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeboxs = 10;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Partes do Corpo'),
        ),
        body: Consumer<UserManager>(builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Peitoral',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadepeitoral');
                      },
                    ),
///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Bicipes',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadebicipes');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Tricipes',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadetricipes');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Ombro',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadeombro');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'AntiBraço',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadeantibraco');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Trapezio',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadetrapezio');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Perna',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadeperna');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Costas',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadecostas');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Airobico',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadeairobico');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: sizeboxs * 2),
                    AnimatedButton(
                      height: 70,
                      width: 400,
                      text: 'Abdominal',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      // textStyle: submitTextStyle,
                      backgroundColor: Color(0xFF00B0FF),
                      borderColor: Colors.white,
                      borderRadius: 0,
                      borderWidth: 2,
                      onPress: () {
                        Navigator.of(context).pushNamed('/listadeabdominal');
                      },
                    ),

///////////////////////////////////////////////////////////////////////////////////
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
