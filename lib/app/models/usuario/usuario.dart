import 'package:ilista_compras_app/app/core/env/env.dart';

class Usuario {
  late final String? nomeUsuario;
  late final DateTime? dataUltimoAcesso;
  late final String? avatar;
  Usuario({
    this.nomeUsuario,
    this.dataUltimoAcesso,
    this.avatar,
  });

  void initState() {
    lerDadoUsuario();
  }

  Future<void> lerDadoUsuario() async {
    nomeUsuario = Env.i['nome_usuario'];
    dataUltimoAcesso = Env.i['ultimo_acesso'] as DateTime;
    avatar = Env.i['avatar'] ?? '';
  }
}
