import 'package:flutter/material.dart';

class CirleAnimation extends StatefulWidget {
  final Widget child;
  const CirleAnimation({
    super.key,
    required this.child,
  });

  @override
  State<CirleAnimation> createState() => _CirleAnimationState();
}

class _CirleAnimationState extends State<CirleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
      child: widget.child,
    );
  }
}
