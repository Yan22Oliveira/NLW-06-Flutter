import 'package:flutter/material.dart';

import '../../shared/themes/themes.dart';

class LabelButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;
  const LabelButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyles.buttonHeading,
        ),
      ),
    );
  }
}
