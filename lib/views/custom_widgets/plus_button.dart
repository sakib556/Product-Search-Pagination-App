import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({super.key, required this.onTap, required this.height});
  final void Function() onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          height: height,
          width: height,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.32, 1.0],
              colors: [
                Color(0xFF1400AE),
                Color(0xFF6210E1),
              ],
              transform: GradientRotation(179.98 * 3.14 / 180),
            ),
          ),
          child: const Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
          )) // your child widget(s) here
          ),
    );
  }
}
