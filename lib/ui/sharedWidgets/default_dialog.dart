import 'package:flutter/material.dart';

class DefaultAppDialog extends StatelessWidget {
  final Widget child;
  final double height;
  DefaultAppDialog({required this.child, required this.height});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: <Widget>[
        Opacity(
          opacity: 1.0,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: height,
            width: double.infinity,
            child: Material(
              borderRadius: BorderRadius.circular(8),
              child: child,
            ),
          ),
        )
      ]),
    );
  }
}
