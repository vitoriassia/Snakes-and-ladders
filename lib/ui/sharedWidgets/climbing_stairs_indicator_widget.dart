import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/sweet_button.dart';
import 'package:snakes_and_ladders/utils/navigation.dart';

class ClimbingStairsIndicator extends StatelessWidget {
  final int positionToBack;

  ClimbingStairsIndicator(this.positionToBack);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.1,
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/subindo_escadas.gif",
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                "Ei, por aqui! Encontramos um atalho, suba as escadas!!",
                style: kTitleStyle.copyWith(
                  color: Colors.white,
                  fontFamily: 'Play',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: SweetButton(
                    text: "Subir",
                    color: Colors.white,
                    borderColor: Colors.green[800]!,
                    isEnable: true,
                    onPressed: () {
                      navigationBack(context: context);
                    },
                    textcolor: Colors.green[800]!,
                    imageIcon: 'assets/icon_climbing.png',
                    icon: Icons.directions_run),
              )
            ],
          )),
        ],
      ),
    );
  }
}
