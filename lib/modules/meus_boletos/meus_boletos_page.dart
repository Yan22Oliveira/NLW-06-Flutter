import 'package:flutter/material.dart';

import 'package:animated_card/animated_card.dart';

import '../../shared/models/models.dart';
import '../../shared/themes/themes.dart';
import '../../shared/widgets/widgets.dart';

class MeusBoletosPage extends StatefulWidget {

  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {

  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_,boletos,__) =>
                      AnimatedCard(
                        direction: AnimatedCardDirection.top,
                        child: BoletoInfoWidget(size: boletos.length),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Meus boletos',
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