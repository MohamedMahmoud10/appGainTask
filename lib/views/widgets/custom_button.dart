import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.borderRadius,
      required this.boxShape,
      required this.color,
      required this.child,
      required this.onTap})
      : super(key: key);
  final double borderRadius;
  final BoxShape boxShape;
  final Color color;
  final Widget child;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            shape: boxShape,
            color: color),
        child: child,
      ),
    );
  }
}
