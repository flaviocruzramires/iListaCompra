import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:sqflite/sqflite.dart';

povoarUsuarioValoresDefault() async {
  Database db = await getDataBase();
  // List<Map<String, Object?>>? tblUsuario = await db.query('usuario');
  // if (tblUsuario.isEmpty) {
  try {
    await db.rawInsert(
        'insert into ${ConstantesApp.i.nometabelaUsuario} (${ConstantesApp.i.idUsuario}, ${ConstantesApp.i.nomeUsuario}, ${ConstantesApp.i.emailUsuario} , ${ConstantesApp.i.senhaUsuario}) values (1 , "Flavio C. Ramiresxx", "flaviocruzramires@gmail.com", "998877") ');
  } on Exception catch (e) {
    throw ('Erro ao povoar tabela ${ConstantesApp.i.nometabelaUsuario}');
  }
  //}
}

String getSQLCriarTabelaUsuario() {
  String sql = '''
      CREATE TABLE If not exists ${ConstantesApp.i.nometabelaUsuario} (
          ${ConstantesApp.i.idUsuario} INTEGER PRIMARY KEY,
          ${ConstantesApp.i.nomeUsuario} varchar(300) NULL,
          ${ConstantesApp.i.emailUsuario} varchar(300) NULL,
          ${ConstantesApp.i.senhaUsuario} varchar(300) NULL
        )
        ''';
  return sql;
}
