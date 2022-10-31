import 'package:flutter/widgets.dart';

class ConstantesApp {
  static ConstantesApp? _instance;
  // Avoid self isntance
  ConstantesApp._();
  static ConstantesApp get i {
    _instance ??= ConstantesApp._();
    return _instance!;
  }

  String get tituloAplicacao => 'Lista de Compras';
  String get tituloHome => 'Últimas listas';
  String get tituloCadastro => 'Nova Lista Compras';

  // ================================================
  String get nomeDoBancoDeDados => 'DBlistaDeCompras.db';
  int get versaoDoBancoDeDados => 1;

  // Inicio tabela compras
  String get nomeTabelaCompras => 'compras';
  String get campoIdTabelaCompras => 'idcompra';
  String get campoDataTabelaCompras => 'datacompra';
  String get campoLocalTabelaCompras => 'Localcompra';
  String get campoFinalizadoTabelaCompras => 'finalizadoCompra';
  // Fim tabela compras

  // Inicio tabela itenscompras
  String get nomeTabelaItensCompras => 'itenscompras';
  String get campoIdTabelaItensCompras => 'iditenscompras';
  String get campoIdTabelaComprasFk => 'idcompraFK';
  String get campoQuantidadeItensCompras => 'quantidadeitenscompras';
  String get campoProdutoItensCompras => 'produtoitenscompras';
  String get campoValorTotalItensCompras => 'valortotalitenscompras';
  // Fim tabela itenscompras

  // Inicio tabela usuario
  String get nometabelaUsuario => 'usuarios';
  String get idUsuario => 'idusuario';
  String get nomeUsuario => 'nomeusuario';
  String get emailUsuario => 'emailusuario';
  String get senhaUsuario => 'senhausuario';

  int get tamanhoFonteTituloAplicacao => 26;

  int get tamanhoFonteAppBarHome => 22;
}

extension ConstantesAppExtensions on BuildContext {
  ConstantesApp get constantes => ConstantesApp.i;
}
