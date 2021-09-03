import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool? buttonFloat;
  final functionFloat;
  AppScaffold({required this.body, this.buttonFloat, this.functionFloat});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 7,
          child: Scaffold(
              floatingActionButton: buttonFloat != null
                  ? Container(
                      height: 55,
                      width: 55.0,
                      child: FloatingActionButton(
                        onPressed: functionFloat,
                        child: Icon(Icons.add),
                        backgroundColor: kPrimaryColor,
                      ),
                    )
                  : null,
              appBar: AppBar(
                centerTitle: true,
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: kPrimaryColor,
                title: Text(
                  'Snakes and ladders',
                  style: TextStyle(
                      color: kSecondColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[],
              ),
              body: Container(
                color: Colors.grey[100],
                child: body,
              )),
        ),
      ],
    );
  }
}
