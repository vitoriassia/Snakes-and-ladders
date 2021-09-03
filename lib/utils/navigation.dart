import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:snakes_and_ladders/utils/animation_trasition_screen.dart';

void navigationTowithAnimation({required context, required page}) {
  developer.log('Navigation with Animation -> ${page.toString()}',
      name: 'NAVIGATION');
  Navigator.push(
    context,
    ScaleRoute(
      page: page,
    ),
  );
}

void navigationTowithAnimationRemoveUtils({required context, required page}) {
  developer.log('Navigation Remove Until with Animation to :  -> ${page.id}',
      name: 'NAVIGATION');
  Navigator.pushAndRemoveUntil(
    context,
    ScaleRoute(
      page: page,
    ),
    (r) => false,
  );
}

void navigationTo({required context, required page}) {
  developer.log('Navigation pushNamed to -> $page', name: 'NAVIGATION');
  Navigator.pushNamed(context, page);
}

void navigationToRemoveUtilsByNamed({required context, required page}) {
  developer.log('Navigation Remove Util by Name to -> $page',
      name: 'NAVIGATION');

  Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
}

void navigationToRemoveUtils({required context, required page}) {
  developer.log('Navigation Remove Util to -> ${page.id}', name: 'NAVIGATION');
  Navigator.pushAndRemoveUntil(context, page, (route) => false);
}

void navigationBack({required context}) {
  developer.log('Navigation Back', name: 'NAVIGATION');
  Navigator.of(context).pop();
}
