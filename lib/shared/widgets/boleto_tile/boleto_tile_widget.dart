import 'package:flutter/material.dart';

import 'package:animated_card/animated_card.dart';

import '../../../shared/models/models.dart';
import '../../../shared/themes/themes.dart';

class BoletoTileWidget extends StatelessWidget {

  final BoletoModel data;
  const BoletoTileWidget({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          'Vence em ${data.dueDate}',
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(
          text: "R\$ ",
          style: TextStyles.trailingRegular,
          children: [
            TextSpan(
              text: "${data.value!.toStringAsFixed(2)}",
              style: TextStyles.trailingBold,
            ),
          ],
        )),
      ),
    );

  }
}
