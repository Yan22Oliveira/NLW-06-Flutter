import 'package:flutter/material.dart';

import 'package:animated_card/animated_card.dart';

import '../../../shared/themes/themes.dart';

class InputTextWidget extends StatelessWidget {

  final String label;
  final IconData icon;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;

  const InputTextWidget({
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Column(
        children: [
          const SizedBox(height: 16,),
          TextFormField(
            initialValue: initialValue,
            controller: controller,
            onChanged: onChanged,
            style: TextStyles.input,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              labelStyle: TextStyles.input,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: AppColors.stroke,
                  ),
                ],
              ),
              border: InputBorder.none,
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
        ],
      ),
    );
  }
}
