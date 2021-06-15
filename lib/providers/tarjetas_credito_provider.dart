import 'package:country/models/credit_card_model.dart';
import 'package:country/services/database_service.dart';
import 'package:flutter/material.dart';

class TarjetasCreditoProvider extends ChangeNotifier{
  List<TarjetaCredito> tarjetas = [];

  String _cardNumber="";
  String _expiryDate="";
  String _cardHolderName="";
  String _cvvCode="";
  String _brand="";
  bool _showBackView=false;



  bool get showBackView{
    return this._showBackView;
  }

  set showBackView(bool showBackView){
    this._showBackView = showBackView;
    notifyListeners();
  }

  String get cardNumber{
    return this._cardNumber;
  }

  set cardNumber(String cardNumber){
    this._cardNumber = cardNumber;
    notifyListeners();
  }


  String get expiryDate{
    return this._expiryDate;
  }

  set expiryDate(String expiryDate){
    this._expiryDate = expiryDate;
    notifyListeners();
  }
  String get cardHolderName{
    return this._cardHolderName;
  }

  set cardHolderName(String cardHolderName){
    this._cardHolderName = cardHolderName;
    notifyListeners();
  }
  
  String get cvvCode{
    return this._cvvCode;
  }

  set cvvCode(String cvvCode){
    this._cvvCode = cvvCode;
    notifyListeners();
  }
  String get brand{
    return this._brand;
  }

  set brand(String brand){
    this._brand = brand;
    notifyListeners();
  }

  
  cargarTarjetas()async{
    final tarjetas = await DBService.db.getAllTarjetas();

    this.tarjetas = [...tarjetas];
    notifyListeners();
    return this.tarjetas;

  }

  
}