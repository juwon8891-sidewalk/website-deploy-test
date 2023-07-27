import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({super.key, required this.child, this.tapCallback});

  final Widget child;
  final Function()? tapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          HapticFeedback.lightImpact();
          if (tapCallback != null) {
            tapCallback!();
          }
        },
        child: MouseRegion(cursor: SystemMouseCursors.click, child: child));
  }
}
