import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';
import 'package:snakes_and_ladders/models/player_model.dart';

class BoardWidget extends StatelessWidget {
  final PlayerModel _playerOne;
  final PlayerModel _playerTwo;
  BoardWidget(this._playerOne, this._playerTwo);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: 600,
        child: Stack(
          children: [
            Image.asset('assets/board_image.png',
                height: 400, fit: BoxFit.fill),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              child: IndicatorPlayerMove(_playerOne.id),
              width: 35,
              height: 35,
              left: _playerOne.position.left,
              bottom: _playerOne.position.bottom,
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              child: IndicatorPlayerMove(_playerTwo.id),
              width: 35,
              height: 35,
              left: _playerTwo.position.left,
              bottom: _playerTwo.position.bottom,
            ),
          ],
        ),
      ),
    );
  }
}

class IndicatorPlayerMove extends StatelessWidget {
  final int playerId;
  IndicatorPlayerMove(this.playerId);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
            color: playerId == 1 ? Colors.blue[600]! : redAppColor, width: 2.0),
      ),
      color: playerId == 1 ? blueAppColor : Colors.red,
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          playerId == 1 ? 'P1' : 'P2',
          style: kAppTitleBlack.copyWith(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }
}
