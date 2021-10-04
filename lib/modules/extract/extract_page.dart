import 'package:flutter/material.dart';

import '../../shared/themes/themes.dart';
import '../../shared/widgets/widgets.dart';

class ExtractPage extends StatefulWidget {

  const ExtractPage({Key? key}) : super(key: key);

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {

  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Meus extratos',
                  style: TextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
              thickness: 1,
              height: 1,
            ),
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
