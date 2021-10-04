import 'package:flutter/material.dart';

import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/themes/themes.dart';
import '../../shared/widgets/widgets.dart';

import './insert_boleto_controller.dart';

class InserteBoletoPage extends StatefulWidget {

  final String? barcode;
  const InserteBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  State<InserteBoletoPage> createState() => _InserteBoletoPageState();
}

class _InserteBoletoPageState extends State<InserteBoletoPage> {

  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: 'R\$',
    decimalSeparator: ',',
  );

  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if(widget.barcode != null){
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 93,),
                child: Text(
                  'Preencha os dados do boleto',
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24,),

              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: 'Nome do boleto',
                      icon: Icons.description_outlined,
                      validator: controller.validateName,
                      onChanged: (value){
                        controller.onChange(
                          name: value,
                        );
                      },
                    ),
                    InputTextWidget(
                      controller: dueDateInputTextController,
                      label: 'Vencimento',
                      icon: FontAwesomeIcons.timesCircle,
                      validator: controller.validateVencimento,
                      onChanged: (value){
                        controller.onChange(
                          dueDate: value,
                        );
                      },
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      label: 'Valor',
                      icon: FontAwesomeIcons.wallet,
                      validator: (_) => controller.validateValor(
                        moneyInputTextController.numberValue,
                      ),
                      onChanged: (value){
                        controller.onChange(
                          value: moneyInputTextController.numberValue,
                        );
                      },
                    ),
                    InputTextWidget(
                      controller: barcodeInputTextController,
                      label: 'Código',
                      icon: FontAwesomeIcons.barcode,
                      validator: controller.validateCodigo,
                      onChanged: (value){
                        controller.onChange(
                          barcode: value,
                        );
                      },
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        labelPrimary: 'Cancelar',
        onTapPrimary: (){
          Navigator.pop(context);
        },
        labelSecondary: 'Cadastrar',
        onTapSecondary: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
