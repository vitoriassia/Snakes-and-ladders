import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';

class LoadingDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/dados_loading.gif",
              ),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          "Jogando os Dados...",
          style: kTitleStyle.copyWith(color: Colors.white),
        )
      ],
    );
  }
}
