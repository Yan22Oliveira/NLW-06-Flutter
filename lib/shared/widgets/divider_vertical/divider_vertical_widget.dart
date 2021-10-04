import 'package:flutter/material.dart';

import '../../../shared/themes/themes.dart';

class DividerVerticalWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.stroke,
    );
  }

}

