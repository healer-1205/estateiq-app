import 'package:flutter/material.dart';

class DivOverlay extends StatelessWidget {
  const DivOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -168.8,
      left: -39,
      child: Container(
        width: 288,
        height: 288,
        decoration: BoxDecoration(
          color: const Color(0xFF059669).withValues(alpha: 0.2), // #059669 20%
          borderRadius: BorderRadius.circular(9999),
        ),
      ),
    );
  }
}
