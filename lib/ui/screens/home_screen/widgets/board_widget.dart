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
        width: 600,
        child: Image.asset('assets/board_image.png',
            height: 400, fit: BoxFit.fill),
      ),
    );
  }
}
