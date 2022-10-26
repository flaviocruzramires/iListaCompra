import 'package:flutter/material.dart';
import 'package:ilista_compras_app/app/services/lista_compras_app.dart';
import 'package:ilista_compras_app/app/core/env/env.dart';
import 'package:ilista_compras_app/app/services/database/database_helper.dart';

Future<void> main() async {
  await Env.i.load();
  DatabaseHelper helper = DatabaseHelper.instance;
  runApp(ListaComprasApp());
}
