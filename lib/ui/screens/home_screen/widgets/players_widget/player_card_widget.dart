import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';
import 'package:snakes_and_ladders/models/player_model.dart';

class PlayerCardWidget extends StatefulWidget {
  final PlayerModel _playerModel;
  final ExpandableController _expandableController;
  PlayerCardWidget(this._playerModel, this._expandableController);

  @override
  _PlayerCardWidgetState createState() => _PlayerCardWidgetState();
}

class _PlayerCardWidgetState extends State<PlayerCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: widget._playerModel.id == 1
                ? Colors.blue.withOpacity(0.5)
                : Colors.red.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        gradient:
            LinearGradient(colors: [Colors.grey[100]!, Colors.grey[300]!]),
      ),
      child: ExpandablePanel(
        controller: widget._expandableController,
        collapsed: Column(
          children: [
            Image.asset(
              widget._playerModel.id == 1
                  ? 'assets/playerOne.png'
                  : 'assets/playerTwo.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
        expanded: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Image.asset(
                widget._playerModel.id == 1
                    ? 'assets/playerOne.png'
                    : 'assets/playerTwo.png',
                width: 40,
                height: 40,
              ),
              Text("Sua vez de jogar!!",
                  style: kTitleStyle.copyWith(
                      color: Colors.black, fontSize: 12, fontFamily: 'Play')),
              Card(
                elevation: 5,
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: widget._playerModel.id == 1
                            ? [Colors.blue[100]!, Colors.blue[300]!]
                            : [Colors.red[100]!, Colors.red[300]!]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_run),
                      Flexible(
                          child: Text(
                              "-> ${widget._playerModel.numberOfPositionIndicator}"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
