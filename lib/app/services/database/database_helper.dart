import 'package:ilista_compras_app/app/services/database/tabelas/compra_script.dart';
import 'package:ilista_compras_app/app/services/database/tabelas/itemcompra_script.dart';
import 'package:ilista_compras_app/app/services/database/tabelas/usuario_script.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  final String _databaseName = ConstantesApp.i.nomeDoBancoDeDados;
  final int _databaseVersion = ConstantesApp.i.versaoDoBancoDeDados;

  final String path = join(await getDatabasesPath(), _databaseName);
  return openDatabase(
    path,
    onCreate: (db, version) {
      onCreate();
    },
    version: _databaseVersion,
  );
}

void onCreate() {}

// void onCreate() async {
//   UsuarioScript.criarTabela();
//   CompraScript.criarTabela();
//   ItemcompraScript.criarTabela();
// }

class CriaDB {
  final int i = 0;

  static execute() async {
    final Database db = await getDataBase();
    // UsuarioScript.criarTabela();
    // CompraScript.criarTabela();
    // ItemcompraScript.criarTabela();
  }
}
