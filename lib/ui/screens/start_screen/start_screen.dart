import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/ui/screens/start_screen/widgets/choice_type_player_widget.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/default_dialog.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/sweet_button.dart';
import 'package:snakes_and_ladders/utils/dialog_transition.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/background_start_screen.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            color: Colors.black.withOpacity(0.60),
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " Cobras e Escadas ",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Play', fontSize: 35),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                child: SweetButton(
                    text: "Jogar",
                    color: Colors.white,
                    borderColor: Colors.green[800]!,
                    isEnable: true,
                    onPressed: () {
                      dialogTransitionScale(context,
                          child: DefaultAppDialog(
                              child: ChoiceTypePlayerWidget(),
                              height:
                                  MediaQuery.of(context).size.height * 0.5));
                    },
                    textcolor: Colors.green[800]!,
                    icon: Icons.play_arrow),
              )
            ],
          ),
        ],
      ),
    );
  }
}
