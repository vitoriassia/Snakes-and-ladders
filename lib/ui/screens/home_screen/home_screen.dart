import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/ui/screens/home_screen/widgets/board_widget.dart';
import 'package:snakes_and_ladders/ui/sharedWidgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoardWidget(),
        ],
      ),
    );
  }
}
