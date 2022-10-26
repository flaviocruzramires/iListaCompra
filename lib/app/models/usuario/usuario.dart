import 'dart:async';

import 'package:flutter/widgets.dart';
//import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ilista_compras_app/app/core/env/env.dart';

// import 'package:ilista_compras_app/app/models/usuario/presenter/usuario_presenter.dart';
// import 'package:ilista_compras_app/app/services/database/database_helper.dart';

class Usuario extends WidgetsFlutterBinding {
  late final String? nomeUsuario;
  late final DateTime? dataUltimoAcesso;
  late final String? avatar;
  late final String? emailUsuario;
  late final String? senhaUsuario;
  Usuario({
    //   this.database, {
    this.nomeUsuario,
    this.dataUltimoAcesso,
    this.avatar,
    this.emailUsuario,
    this.senhaUsuario,
  });

  void initState() {
    lerDadoUsuario();
  }

  Future<void> lerDadoUsuario() async {
    // Future<List<Map>> tabela;
    // tabela = UsuarioPresenter.obterRegistros(db: DatabaseHelper.instance.database);
    nomeUsuario = Env.i['nome_usuario'];
    dataUltimoAcesso = Env.i['ultimo_acesso'] as DateTime;
    avatar = Env.i['avatar'] ?? '';
  }

  //WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.

  // final Database database;

  // Future<List<Usuario>> usuariolista() async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Query the table for all The Dogs.
  //   final List<Map<String, dynamic>> maps = await db.query('usuarios');

  //   // Convert the List<Map<String, dynamic> into a List<Dog>.
  //   return List.generate(maps.length, (i) {
  //     return Usuario(
  //       nomeUsuario: maps[i]['nome_usuario'],
  //       emailUsuario: maps[i]['email_usuario'],
  //       avatar: maps[i]['senha_usuario']
  //     );
  //   });
  // }
}
