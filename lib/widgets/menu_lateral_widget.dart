import 'package:flutter/material.dart';
import 'package:country/helpers/preferencias_usuario.dart';

class MenuLateralWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final phoneSize = MediaQuery.of(context).size;
    final prefs = PreferenciasUsuario();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Text('BIENVENIDO', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0 )),
                Expanded(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outlined, color: Colors.green, size: phoneSize.width*0.25,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${prefs.nombreSocio}', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),),
                          Text('correocliente@prueba.com', style: TextStyle(color: Colors.black45),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              // color: Colors.red
            ),
          ),
          Divider(thickness: 2.0, color: Colors.black38, height: 0.0,),
          
          _OpcionMenu(icono: Icon(Icons.attach_money_rounded, color:Colors.black), titulo: 'Tarjeta de consumo', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.topic, color:Colors.black), titulo: 'Historico de pagos', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.topic, color:Colors.black), titulo: 'Reservas', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.topic, color:Colors.black), titulo: 'Eventos', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.topic, color:Colors.black), titulo: 'Menu', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.topic, color:Colors.black), titulo: 'Ranking', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.topic, color:Colors.black), titulo: 'Inbox', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.topic, color:Colors.black), titulo: 'Contactanos', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.lock, color:Colors.black), titulo: 'Politica de privacidad', ruta: 'ruta'),
          _OpcionMenu(icono: Icon(Icons.info_outline, color:Colors.black), titulo: 'Acerca de Country Clubs', ruta: 'ruta'),
        ],
      ),

    );
  }
}

class _OpcionMenu extends StatelessWidget {

  final Icon icono;
  final String titulo;
  final String ruta;

  const _OpcionMenu({ @required this.icono, @required this.titulo, @required this.ruta});
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: this.icono,
      title: Text(this.titulo),
      onTap: () => {
         
      },
    );
  }
}