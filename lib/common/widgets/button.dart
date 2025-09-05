import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleButton extends StatelessWidget {
  final String goRoute;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;

  const SimpleButton({
    super.key,
    required this.goRoute,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.go(goRoute),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}