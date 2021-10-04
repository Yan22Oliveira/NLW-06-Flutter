import 'package:flutter/material.dart';

import '../widgets.dart';
import '../../models/models.dart';

class BoletoListWidget extends StatefulWidget {

  final BoletoListController controller;
  BoletoListWidget({required this.controller});

  @override
  State<BoletoListWidget> createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_,boletos,__) =>
        Column(
          children: widget.controller.boletos.map((boleto) =>
              BoletoTileWidget(data: boleto)
          ).toList(),
        ),
    );
  }

}
