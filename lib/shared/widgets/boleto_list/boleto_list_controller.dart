import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/models.dart';

class BoletoListController {

  BoletoListController(){
    getBoletos();
  }

  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  Future<void> getBoletos() async{
    try{
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('boletos') ?? <String>[];
      boletos =  response.map((boleto) => BoletoModel.fromJson(boleto)).toList();
    }catch(erro){
      boletos = <BoletoModel>[];
    }
  }

}
