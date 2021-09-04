import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/home_screen.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/button_invisible_with_border_color.dart';
import 'package:snakes_and_ladders/utils/navigation.dart';

class ChoiceTypePlayerWidget extends StatefulWidget {
  ChoiceTypePlayerWidget();

  @override
  _ChoiceTypePlayerWidgetState createState() => _ChoiceTypePlayerWidgetState();
}

class _ChoiceTypePlayerWidgetState extends State<ChoiceTypePlayerWidget> {
  bool playerOne = false;
  bool playerTwo = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text('Selecione qual jogador você quer ser:',
                style: kAppTitleBlack),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      playerOne = !playerOne;
                      playerTwo = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: playerOne ? 170 : 140,
                    height: playerOne ? 230 : 140,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'JOGADOR 1',
                              style: kTitleStyle.copyWith(
                                  color: blueAppColor,
                                  fontSize: 16,
                                  fontFamily: 'Play',
                                  fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/playerOne.png',
                              width: 70,
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 500),
                                style: playerOne
                                    ? kTitleStyle.copyWith(
                                        color: blueAppColor, fontSize: 12)
                                    : kTitleStyle.copyWith(
                                        color: Colors.green, fontSize: 0),
                                child: Text(
                                  'Seja o primeiro a jogar!',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      playerTwo = !playerTwo;
                      playerOne = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: playerTwo ? 170 : 140,
                    height: playerTwo ? 230 : 140,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'JOGADOR 2',
                              style: kTitleStyle.copyWith(
                                  color: redAppColor,
                                  fontSize: 16,
                                  fontFamily: 'Play',
                                  fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/playerTwo.png',
                              width: 70,
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 500),
                                style: playerTwo
                                    ? kTitleStyle.copyWith(
                                        color: redAppColor, fontSize: 12)
                                    : kTitleStyle.copyWith(
                                        color: Colors.green, fontSize: 0),
                                child: Text(
                                  'Seja o segundo a jogar!',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          isSelect()
              ? Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: buttonInvisibleWithBorderColor(
                      icon: Icons.play_arrow,
                      color: playerOne ? blueAppColor : redAppColor,
                      onPress: () {
                        navigationTowithAnimationRemoveUtils(
                            context: context, page: HomeScreen());
                      },
                      text: 'JOGAR'),
                )
              : Container()
        ],
      ),
    );
  }

  bool isSelect() {
    if (playerOne || playerTwo) {
      return true;
    } else {
      return false;
    }
  }
}
