import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/constants.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool? buttonFloat;
  final Function()? functionFloat;
  AppScaffold({required this.body, this.buttonFloat, this.functionFloat});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            floatingActionButton: buttonFloat != null && buttonFloat!
                ? Container(
                    height: 55,
                    width: 55.0,
                    child: FloatingActionButton(
                      onPressed: functionFloat,
                      child: Icon(Icons.casino),
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
              backgroundColor: Colors.green[800]!,
              title: Text(
                'Cobras e Escadas',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Play',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[],
            ),
            body: Container(
              color: Colors.grey[100],
              child: Stack(children: [
                Image.asset(
                  'assets/background_start_screen.jpeg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                Container(
                  color: Colors.white.withOpacity(0.30),
                  height: double.infinity,
                  width: double.infinity,
                ),
                body
              ]),
            )),
      ],
    );
  }
}
