import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/sweet_button.dart';
import 'package:snakes_and_ladders/utils/navigation.dart';

class WinnerIndicatorWidget extends StatelessWidget {
  final int playerIdWinner;
  WinnerIndicatorWidget(this.playerIdWinner);
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
                      "assets/winner_gif.gif",
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                "Parabéns Jogador $playerIdWinner!!! Você venceu!",
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
                    text: "Jogar novamente.",
                    color: Colors.white,
                    borderColor: Colors.green[800]!,
                    isEnable: true,
                    onPressed: () {
                      navigationBack(context: context);
                    },
                    textcolor: Colors.green[800]!,
                    icon: Icons.sports_esports),
              )
            ],
          )),
        ],
      ),
    );
  }
}
