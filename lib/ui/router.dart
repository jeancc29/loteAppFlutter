import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loterias/ui/contacto/contactoscreen.dart';
import 'package:loterias/ui/login/login.dart';
import 'package:loterias/ui/splashscreen.dart';
import 'package:loterias/ui/views/actualizar/actualizar.dart';
import 'package:loterias/ui/views/ajustes/ajustesscreen.dart';
import 'package:loterias/ui/views/balance/balancebanca.dart';
import 'package:loterias/ui/views/bluetoothdevice/bluetooth.dart';
import 'package:loterias/ui/views/dashboard/dashboard.dart';
import 'package:loterias/ui/views/monitoreo/monitoreo.dart';
import 'package:loterias/ui/views/notificacion/notificacion.dart';
import 'package:loterias/ui/views/notificacion/ver.dart';
import 'package:loterias/ui/views/premios/registrarpremios.dart';
import 'package:loterias/ui/views/principal/principal.dart';
import 'package:loterias/ui/views/principal/probarnullsafety.dart';
import 'package:loterias/ui/views/principal/probartiemporestante.dart';
import 'package:loterias/ui/views/principal/prueba2.dart';
import 'package:loterias/ui/views/reportes/historicoventas.dart';
import 'package:loterias/ui/views/reportes/reportejugadasscreen.dart';
import 'package:loterias/ui/views/reportes/ticketspendientespago.dart';
import 'package:loterias/ui/views/reportes/ventas.dart';
import 'package:loterias/ui/views/transaccion/add.dart';
import 'package:loterias/ui/views/transaccion/transacciones.dart';


class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
          builder: (_)=> PrincipalApp(callThisScreenFromLogin: (settings.arguments != null) ? settings.arguments : false,)
        );
        // return  MaterialPageRoute(
        //   builder: (_)=> ProbarNullSafety()
        // );
        // return  MaterialPageRoute(
        //   builder: (_)=> ProbarTiempoRestante()
        // );
      case '/prueba2' :
        return  MaterialPageRoute(
          builder: (_)=> Prueba2()
        );
      case '/login' :
        return  MaterialPageRoute(
          builder: (_)=> LoginScreen()
        );
      case '/principal' :
        return  MaterialPageRoute(
          builder: (_)=> PrincipalApp(callThisScreenFromLogin: (settings.arguments != null) ? true : false,)
        );
        case '/bluetooth' :
          return MaterialPageRoute(
            builder: (_)=> BluetoothScreen()
          ) ;
        case '/monitoreo' :
          return MaterialPageRoute(
            builder: (_)=> MonitoreoScreen()
          ) ;
        case '/registrarPremios' :
          return MaterialPageRoute(
            builder: (_)=> RegistrarPremiosScreen()
          ) ;
        case '/historicoVentas' :
          return MaterialPageRoute(
            builder: (_)=> HistoricoVentasScreen()
          ) ;
        case '/ventas' :
          return MaterialPageRoute(
            builder: (_)=> VentasScreen()
          ) ;
        case '/balanceBancas' :
          return MaterialPageRoute(
            builder: (_)=> BalanceBancaScreen()
          ) ;
        case '/pendientesPago' :
          return MaterialPageRoute(
            builder: (_)=> TicketsPendientesPagoScreen()
          ) ;
        case '/dashboard' :
          return MaterialPageRoute(
            builder: (_)=> DashboardScreen()
          ) ;
        case '/actualizar' :
          return MaterialPageRoute(
            builder: (_)=> ActualizarScreen(settings.arguments)
          ) ;
        case '/transacciones' :
          return MaterialPageRoute(
            builder: (_)=> TransaccionesScreen()
          ) ;
        case '/addTransacciones' :
          return MaterialPageRoute(
            builder: (_)=> AddTransaccionesScreen()
          ) ;
        case '/notificaciones' :
          return MaterialPageRoute(
            builder: (_)=> NotificacionScreen()
          ) ;
        case '/contacto' :
          return MaterialPageRoute(
            builder: (_)=> ContactoScreen()
          ) ;
        case '/verNotificaciones' :
          return MaterialPageRoute(
            builder: (_)=> VerNotificacionScreen(notificacion: settings.arguments,)
          ) ;
        case '/reporteJugadas' :
          return MaterialPageRoute(
            builder: (_)=> ReporteJugadasScreen()
          ) ;
        case '/ajustes' :
          return MaterialPageRoute(
            builder: (_)=> AjustesScreen()
          ) ;
      // case '/' :
      //   return  MaterialPageRoute(
      //     builder: (_)=> SplashScreen()
      //   );
      // case '/' :
      //   return  MaterialPageRoute(
      //     builder: (_)=> PrincipalApp()
      //   );
      // case '/' :
      //   return MaterialPageRoute(
      //     builder: (_)=> PruebaApp()
      //   ) ;
      // case '/addArticulo' :
      //   return MaterialPageRoute(
      //     builder: (_)=> addArticulo()
      //   ) ;
      // case '/articulos' :
      //   return MaterialPageRoute(
      //     builder: (_)=> ArticulosApp()
      //   ) ;
      // case '/AddProyecto' :
      //   return MaterialPageRoute(
      //     builder: (_)=> AddProyecto()
      //   ) ;
      // case '/proyectos' :
      //   return MaterialPageRoute(
      //     builder: (_)=> ProyectosApp()
      //   ) ;
      // case '/addProduct' :
      //   return MaterialPageRoute(
      //     builder: (_)=> AddProduct()
      //   ) ;
      // case '/productDetails' :
      //   return MaterialPageRoute(
      //       builder: (_)=> ProductDetails()
      //   ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}