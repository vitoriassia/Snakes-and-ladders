import 'package:flutter/material.dart';

class BoardWidget extends StatefulWidget {
  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Image.asset(
          'assets/board_image.png',
        ),
      ),
    );
  }
}
