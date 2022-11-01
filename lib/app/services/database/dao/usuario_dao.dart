import 'package:ilista_compras_app/app/models//usuario/usuario.dart';
import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDao {
  Map<String, dynamic> _toMap(Usuario usuario) {
    final Map<String, dynamic> usuarioMap = Map();
    //usuarioMap[ConstantesApp.i.campoIdTabelaCompras] = usuario.id;
    usuarioMap[ConstantesApp.i.nomeUsuario] = usuario.nomeUsuario;
    usuarioMap[ConstantesApp.i.emailUsuario] = usuario.emailUsuario;

    return usuarioMap;
  }

  List<Usuario> _toList(List<Map<String, dynamic>> result) {
    final List<Usuario> usuarios = [];
    for (Map<String, dynamic> row in result) {
      final Usuario usuario = Usuario(
        nomeUsuario: row[ConstantesApp.i.nomeUsuario],
        emailUsuario: row[ConstantesApp.i.emailUsuario],
        senhaUsuario: row[ConstantesApp.i.senhaUsuario],
      );
      usuarios.add(usuario);
    }
    return usuarios;
  }

  Future<int> incluir(Usuario usuario) async {
    final Database db = await getDataBase();
    Map<String, dynamic> usuarioMap = _toMap(usuario);
    return db.insert(ConstantesApp.i.nomeTabelaCompras, usuarioMap);
  }

  Future<List<Usuario>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result =
        await db.query(ConstantesApp.i.nometabelaUsuario);
    List<Usuario> usuarios = _toList(result);
    return usuarios;
  }
}
