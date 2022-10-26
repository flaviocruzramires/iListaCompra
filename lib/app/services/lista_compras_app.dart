import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:ilista_compras_app/app/core/theme/theme_config.dart';
import 'package:ilista_compras_app/app/pages/home/home_page.dart';
import 'package:ilista_compras_app/app/pages/splash/splash_page.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:ilista_compras_app/app/models/usuario/usuario.dart';
import 'package:sqflite/sqflite.dart';
import '../pages/novalista/nova_lista.dart';
import 'database/database_helper.dart';

class ListaComprasApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  final dbHelper = DatabaseHelper.instance;
  ListaComprasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
        bindingsBuilder: () => [
              Bind.lazySingleton<Usuario>((i) => Usuario()),
            ],
        child: MaterialApp(
          title: ConstantesApp.i.tituloAplicacao,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.theme,
          routes: {
            '/': (_) => const SplashPage(),
            // '/auth/login': (_) => const LoginRoute(),
            // '/auth/register': (_) => const RegisterRoute(),
            '/home': (_) => const HomePage(),
            '/novalista': (_) => const NovaLista(),
          },
        ));
  }
}
