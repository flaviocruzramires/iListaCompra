import 'dart:io' show Directory;
import 'package:ilista_compras_app/app/services/database/tabelas/compra_script.dart';
import 'package:ilista_compras_app/app/services/database/tabelas/itemcompra_script.dart';
import 'package:ilista_compras_app/app/services/database/tabelas/usuario_script.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class DatabaseHelper {
  final String _databaseName = ConstantesApp.i.nomeDoBancoDeDados;
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  database() async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onOpen: _onCreate());
  }

  static _onCreate() async {
    UsuarioScript.criarTabela();
    CompraScript.criarTabela();
    ItemcompraScript.criarTabela();
  }
}
