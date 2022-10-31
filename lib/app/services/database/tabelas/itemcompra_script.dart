import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:sqflite/sqflite.dart';

povoarItemCompraValoresDefault() async {
  Database db = await getDataBase();

  try {
    await db.rawInsert(
        'insert into ${ConstantesApp.i.nomeTabelaItensCompras} (${ConstantesApp.i.campoIdTabelaItensCompras}, ${ConstantesApp.i.campoIdTabelaComprasFk}, ${ConstantesApp.i.campoQuantidadeItensCompras} , ${ConstantesApp.i.campoProdutoItensCompras} , ${ConstantesApp.i.campoValorTotalItensCompras}  ) values (1 , 1 , 285 , "Palito de Fosforo", 3) ');
    await db.rawInsert(
        'insert into ${ConstantesApp.i.nomeTabelaItensCompras} (${ConstantesApp.i.campoIdTabelaItensCompras}, ${ConstantesApp.i.campoIdTabelaComprasFk}, ${ConstantesApp.i.campoQuantidadeItensCompras} , ${ConstantesApp.i.campoProdutoItensCompras} , ${ConstantesApp.i.campoValorTotalItensCompras}  ) values (2 , 1 , 3 , "Picanha, 3) ');
    await db.rawInsert(
        'insert into ${ConstantesApp.i.nomeTabelaItensCompras} (${ConstantesApp.i.campoIdTabelaItensCompras}, ${ConstantesApp.i.campoIdTabelaComprasFk}, ${ConstantesApp.i.campoQuantidadeItensCompras} , ${ConstantesApp.i.campoProdutoItensCompras} , ${ConstantesApp.i.campoValorTotalItensCompras}  ) values (3 , 1 , 300 , "Heineken 600ml", 324) ');
    await db.rawInsert(
        'insert into ${ConstantesApp.i.nomeTabelaItensCompras} (${ConstantesApp.i.campoIdTabelaItensCompras}, ${ConstantesApp.i.campoIdTabelaComprasFk}, ${ConstantesApp.i.campoQuantidadeItensCompras} , ${ConstantesApp.i.campoProdutoItensCompras} , ${ConstantesApp.i.campoValorTotalItensCompras}  ) values (4 , 1 , 3 , "Mandioca", 30) ');
  } on Exception catch (e) {
    throw ('Erro ao povoar tabela ${ConstantesApp.i.nomeTabelaItensCompras}');
  }
}

getSQLCriarTabelaItemCompra() {
  String sql = '''
      CREATE TABLE If not exists ${ConstantesApp.i.nomeTabelaItensCompras} (
          ${ConstantesApp.i.campoIdTabelaItensCompras} INTEGER PRIMARY KEY,
          ${ConstantesApp.i.campoIdTabelaComprasFk} integer NULL,
          ${ConstantesApp.i.campoQuantidadeItensCompras} integer NULL,
          ${ConstantesApp.i.campoProdutoItensCompras} varchar(300) NULL,
          ${ConstantesApp.i.campoValorTotalItensCompras} decimal(12,2)
        )
        ''';
  return sql;
}
