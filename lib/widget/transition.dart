import 'dart:ui';

import 'package:flutter/widgets.dart';

Widget TransitionToLeftWidget(
    {required double factor,
    required double amount,
    required Duration duration,
    required Widget child}) {
  return AnimatedPadding(
    padding: EdgeInsets.only(left: factor * amount),
    duration: duration,
    child: child,
  );
}

Widget TransitionToBototmWidget(
    {required double factor,
    required double amount,
    required Duration duration,
    required Widget child,
    bool hasOpacity = false}) {
  return AnimatedPadding(
    padding: EdgeInsets.only(bottom: factor * amount),
    duration: duration,
    child:
        AnimatedOpacity(opacity: 1 - factor, duration: duration, child: child),
  );
}

Widget TransitionToLeftWithAlign(
    {required double factor,
    required double amount,
    required Duration duration,
    required Widget child,
    bool hasOpacity = false}) {
  return AnimatedAlign(
    alignment: AlignmentDirectional(factor, 0),
    duration: duration,
    child:
        AnimatedOpacity(opacity: 1 - factor, duration: duration, child: child),
  );
}

Widget TransitionWithAlign({
  required double factor,
  required double from,
  required double to,
  required Duration duration,
  required Widget child,
  bool hasOpacity = false,
  bool isHorizontal = false,
}) {
  return AnimatedAlign(
    alignment: AlignmentDirectional(
        !isHorizontal ? 0 : lerpDouble(from, to, factor) ?? 0,
        isHorizontal ? 0 : lerpDouble(from, to, factor) ?? 0),
    duration: duration,
    child: AnimatedOpacity(
        opacity: hasOpacity ? factor : 1, duration: duration, child: child),
  );
}

Widget TransitionWithAlignAndOp({
  required double factor,
  required double from,
  required double to,
  required Duration duration,
  required Widget child,
  bool isHorizontal = false,
  required double opFactor,
}) {
  return AnimatedAlign(
    alignment: AlignmentDirectional(
        !isHorizontal ? 0 : lerpDouble(from, to, factor) ?? 0,
        isHorizontal ? 0 : lerpDouble(from, to, factor) ?? 0),
    duration: duration,
    child: AnimatedOpacity(opacity: opFactor, duration: duration, child: child),
  );
}
