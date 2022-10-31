import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioPresenter {
  String tabela = ConstantesApp.i.nometabelaUsuario;

  obterDadosUsuario() async {
    // Database db = DatabaseHelper.instance.getdatabase();
    // return await db.query(tabela);
  }

//  static var result;
  // static Future<List<Map>> obterRegistros(
  //   DatabaseHelper db,
  // ) async =>
  //     result = await db.query(DatabaseHelper.tabela);
}
