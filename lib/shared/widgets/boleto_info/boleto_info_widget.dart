import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class BoletoInfoWidget extends StatelessWidget {

  final int size;
  const BoletoInfoWidget({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secundary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            Container(
              width: 1,
              height: 32,
              color: AppColors.background,
            ),
            Text.rich(
              TextSpan(
                text: "Você tem ",
                style: TextStyles.captionBackground,
                children: [
                  TextSpan(
                    text: "$size boletos\n",
                    style: TextStyles.captionBoldBackground,
                  ),
                  TextSpan(
                    text: "cadastrados para pagar",
                    style: TextStyles.captionBackground,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
