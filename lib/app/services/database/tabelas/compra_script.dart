import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:sqflite/sqflite.dart';

povoarCompraValoresDefault() async {
  Database db = await getDataBase();

  try {
    await db.rawInsert(
        'insert into ${ConstantesApp.i.nomeTabelaCompras} (${ConstantesApp.i.campoIdTabelaCompras}, ${ConstantesApp.i.campoDataTabelaCompras}, ${ConstantesApp.i.campoLocalTabelaCompras} ) values (1 , 2021.10.10, "Assai Atacadista") ');
  } on Exception catch (e) {
    throw ('Erro ao povoar tabela ${ConstantesApp.i.nomeTabelaCompras}');
  }
}

getSQLCriarTabelaCompra() {
  String sql = '''
      CREATE TABLE If not exists ${ConstantesApp.i.nomeTabelaCompras} (
          ${ConstantesApp.i.campoIdTabelaCompras} INTEGER PRIMARY KEY,
          ${ConstantesApp.i.campoDataTabelaCompras} datetime NULL,
          ${ConstantesApp.i.campoLocalTabelaCompras} varchar(300) NULL
        )
        ''';
  return sql;
}
