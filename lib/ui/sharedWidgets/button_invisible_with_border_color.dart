import 'package:flutter/material.dart';

Widget buttonInvisibleWithBorderColor(
    {required Function() onPress,
    required String text,
    IconData? icon,
    required Color color}) {
  return TextButton(
    style: TextButton.styleFrom(
        primary: Colors.transparent,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: color, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8.0)),
        textStyle: TextStyle(
          color: color,
        )),
    onPressed: onPress,
    child: Container(
      width: double.infinity,
      child: Center(
          child: icon == null
              ? Text(text,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 20,
                      color: color,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(text,
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold)),
                  ],
                )),
    ),
  );
}
