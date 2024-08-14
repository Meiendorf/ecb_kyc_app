import 'package:flutter/material.dart';

class FigmaButtonBottom extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final bool isDiactivated;

  const FigmaButtonBottom({
    super.key,
    required this.onPressed,
    required this.label,
    this.isDiactivated = false,
  });

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 224, 219, 219),
      foregroundColor: Color.fromARGB(255, 51, 51, 51),
    );

    if (isDiactivated) {
      buttonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
      );
    }

    return ElevatedButton(
      onPressed: isDiactivated ? () {} : onPressed,
      style: buttonStyle,
      child: Text(
        label,
        style: const TextStyle().copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}