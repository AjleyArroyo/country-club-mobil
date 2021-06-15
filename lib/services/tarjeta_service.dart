
import 'dart:convert';

import 'package:country/helpers/preferencias_usuario.dart';
import 'package:country/models/compra_model.dart';
import 'package:country/models/detalle_compra_model.dart';
import 'package:country/models/deudas_model.dart';
import 'package:country/models/pagos_model.dart';
import 'package:country/utils/comprobar_conexion.dart';
import "package:http/http.dart" as http;

class TarjetaService {

  String user = 'Loyalty';
  String password = 'L0ya1tyc1ub5*';
  final prefs = PreferenciasUsuario();


  String basicAuthenticationHeader(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }

  Future<dynamic> _procesarInfo(Uri url) async{
    final resp = await http.get(url,
      headers: {
        "authorization": basicAuthenticationHeader(user, password)
      }
    );
    return json.decode(resp.body);
  }


  Future<String> obtenerSaldo(String codigoSocio) async{
    // print('consulta a la bd');

    final url = Uri.http('190.186.228.218', 'appmovil/api/Tarjeta/GetCreditCardID/$codigoSocio');

    final respuesta = await _procesarInfo(url);
     if(respuesta == null)return null;
    
 
    return respuesta[0]["saldo"].toString();
    
    // return "450";
  }
  Future<List<Compra>> obtenerHistoricoCompras(String codigoSocio) async{
    // print('consulta a la bd');

    final conexion = await comprobarInternet();

    if (!conexion) {
      return [null];
    }

    final url = Uri.http('190.186.228.218', 'appmovil/api/Tarjeta/GetCardHistoryID/$codigoSocio');

    final respuesta = await _procesarInfo(url);
    
     if(respuesta == null)return null;

    final compras = Compras.fromJsonList(respuesta);

    return compras.items;
  
  }


  Future<List<DetalleCompra>> obtenerDetalleCompra(String idVenta) async{
      // print('consulta a la bd');

      final conexion = await comprobarInternet();

    if (!conexion) {
      return [null];
    }

      final url = Uri.http('190.186.228.218', 'appmovil/api/Tarjeta/GetCardHistoryDetailID/$idVenta');

      final respuesta = await _procesarInfo(url);
    
     if(respuesta == null)return null;

      final detalles = Detalles.fromJsonList(respuesta);

      return detalles.items;

    // return compras.items;
  
  }
  Future<List<Pago>> obtenerHistoricoPagos() async{
      // print('consulta Historial pagos');

      final conexion = await comprobarInternet();
      

    if (!conexion) {
      return [null];
    }

      final url = Uri.http('190.186.228.218', 'appmovil/api/Pagos/GetPaymentHistoryID/${prefs.codigoSocio}');

      final respuesta = await _procesarInfo(url);
    
     if(respuesta == null)return null;

      final detalles = Pagos.fromJsonList(respuesta);

      return detalles.items;

    // return compras.items;
  
  }

  Future<List<Deuda>> obtenerHistoricoDeudas() async{
    // print('consulta Historial deudas');

    final conexion = await comprobarInternet();
      
    if (!conexion) {
      return [null];
    }

    final url = Uri.http('190.186.228.218', 'appmovil/api/Deudas/GetDebtsHistoryID/${prefs.codigoSocio}');

    final respuesta = await _procesarInfo(url);
    
    if(respuesta == null)return null;

    final detalles = Deudas.fromJsonList(respuesta);

    return detalles.items;

    // return compras.items;
  
  }

}