import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:sqflite/sqflite.dart';

class CompraScript {
  static criarTabela() async {
    Database db = DatabaseHelper.instance.database();

    try {
      await db.execute('''
      CREATE TABLE ${ConstantesApp.i.nomeTabelaCompras} (
          ${ConstantesApp.i.campoIdTabelaCompras} INTEGER PRIMARY KEY,
          ${ConstantesApp.i.campoDataTabelaCompras} datetime NULL,
          ${ConstantesApp.i.campoLocalTabelaCompras} varchar(300) NULL
        )
        ''');
    } on Exception catch (e) {
      throw ('Erro ao criar tabela ${ConstantesApp.i.nomeTabelaCompras}');
    }
    try {
      povoarValoresDefault();
    } on Exception catch (e, s) {
      throw ('Erro ao povoar Default Compras');
    }
  }

  static povoarValoresDefault() async {
    Database db = DatabaseHelper.instance.database();
    List<Map<String, Object?>>? tblUsuario = await db.query('compras');
    if (tblUsuario.isEmpty) {
      try {
        await db.rawInsert(
            'insert into ${ConstantesApp.i.nomeTabelaCompras} (${ConstantesApp.i.campoIdTabelaCompras}, ${ConstantesApp.i.campoDataTabelaCompras}, ${ConstantesApp.i.campoLocalTabelaCompras} ) values (1 , 2021.10.10, "Assai Atacadista") ');
      } on Exception catch (e) {
        throw ('Erro ao povoar tabela ${ConstantesApp.i.nomeTabelaCompras}');
      }
    }
  }
}
