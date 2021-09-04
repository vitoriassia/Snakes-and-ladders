// import 'package:flutter/material.dart';
// import 'package:snakes_and_ladders/constants.dart';
// import 'package:snakes_and_ladders/ui/sharedWidgets/loading_dice.dart';
// import 'package:snakes_and_ladders/ui/sharedWidgets/result_dice_widget.dart';

// class DiceWidget extends StatelessWidget {
//   final bool _loadingDice;

//   DiceWidget(this._loadingDice);
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//             color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
//         width: 100,
//         height: 100,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ResultDice(2, 4, !_loadingDice),
//             LoadingDice(_loadingDice),
//           ],
//         ),
//       ),
//     );
//   }
// }
