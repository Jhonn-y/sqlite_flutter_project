// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String  name ='';
  String imgAvatar = '';
  String bithDate = '';
  

  void modifyData(){
    name ='Jhonatan';
    imgAvatar = 'https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-536613027.jpg';
    bithDate = '08/10/2004';
    notifyListeners();
  }

  void modifyName() {
    name = "carlos";
    notifyListeners();
}
}