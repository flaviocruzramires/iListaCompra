import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:ilista_compras_app/app/core/env/env.dart';
// import 'package:ilista_compras_app/app/core/ui/styles/button_styles.dart';
import 'package:ilista_compras_app/app/core/ui/styles/colors_app.dart';
import 'package:ilista_compras_app/app/core/ui/styles/text_styles.dart';
// import 'package:ilista_compras_app/app/core/ui/widgets/button.dart';
// import 'package:ilista_compras_app/app/core/ui/widgets/snackbar_custom.dart';
import 'package:ilista_compras_app/app/models/listagem_compra/compra_model.dart';
// import 'package:ilista_compras_app/app/models/usuario/presenter/usuario_presenter.dart';
import 'package:ilista_compras_app/app/models/usuario/usuario.dart';
import 'package:ilista_compras_app/app/services/database/dao/compra_dao.dart';
// import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
// import 'package:ilista_compras_app/app/core/ui/widgets/status_tile.dart';
// import 'package:ilista_compras_app/app/utils/enums_app.dart';
// import 'package:ilista_compras_app/app/utils/funcoes_app.dart';
// import 'package:intl/intl.dart';
// import 'package:sqflite/sqflite.dart';

import '../../services/database/dao/usuario_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime? dataSelecionada = DateTime.now();

  final CompraDao _dao = CompraDao();
  final UsuarioDao _daoUsuario = UsuarioDao();

  // final dbHelper = DatabaseHelper.instance;

//  static int get length => null;

  Future<void> setDataSelecionada(DateTime date) async {
    dataSelecionada = date;
  }

  DateTime? getDataSelecionada() {
    return dataSelecionada;
  }

  // Usuario getUsuario() {
  //   final Usuario usuario = Usuario();
  //   final UsuarioDao _daoUsuario = UsuarioDao();

  //   Future<List<Usuario>> _usuarios = _daoUsuario.findAll();
  //   List<Usuario> _usr = [];
  //   _usuarios.then((value) => _usr);
  //   usuario.nomeUsuario = _usr[0].nomeUsuario;
  //   usuario.emailUsuario = _usr[0].emailUsuario;

  //   return usuario;
  // }

  getDrawerCustom() {
    //final Usuario usr = getUsuario();
    final Usuario usr = Usuario(
        nomeUsuario: 'Flavio XUMBADO',
        dataUltimoAcesso: getDataSelecionada(),
        avatar: '',
        emailUsuario: 'flavio@flavio.com.br',
        senhaUsuario: '998877');
    return Drawer(
      backgroundColor: context.colors.grey,
      child: Column(children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(color: context.colors.grey),
            child: Column(
              children: [
                Text('Olá ${usr.nomeUsuario}'),
                Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: 105,
                    child: Image.asset(
                      'assets/images/flavio_avatar_small.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text('Nova Compra'),
          onTap: () {
            Navigator.of(context).pushNamed('/novalista');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Configurações'),
          onTap: (() {
            Navigator.of(context).pushNamed('/configuracoes');
          }),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Sair'),
          onTap: (() {}),
        ),
      ]),
    );
  }

  getListViewDadosCompras() {
    return Column(
      children: [
        FutureBuilder<List<CompraModel>>(
            initialData: [],
            future: _dao.findAll(),
            builder: (context, snapshot) {
              final List<CompraModel>? compras = snapshot.data;
              return Column(
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: compras!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final CompraModel compra = compras[index];
                      return Card(
                        elevation: 3,
                        color: context.colors.primary,
                        child: ListTile(
                          title: Text(
                            compra.localCompra!,
                            //'${FuncoesApp.formataDataPadraoBR(lista[index].dataCompra!)} - ${lista[index].localCompra}',
                            //'Lista ${lista[index].idCompra} - ${lista[index].dataCompra} , ${lista[index].localCompra}',
                            style: context.textStyles.textPrimaryFontSemiBold
                                .copyWith(color: context.colors.white),
                          ),
                          leading: Icon(
                            Icons.payment,
                            color: context.colors.white,
                          ),
                          selected: true,
                          tileColor: context.colors.greyDark,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Column(
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(
                                        Icons.info,
                                        color: ColorsApp.i.white,
                                      ),
                                      title: Text(
                                        'Titulo',
                                        style: TextStyle(
                                          color: ColorsApp.i.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Titulo',
                                        style: TextStyle(
                                          color: ColorsApp.i.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // povoaObjeto();

    return Scaffold(
      backgroundColor: ColorsApp.i.primary,
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        iconTheme: IconThemeData(color: context.colors.white), // IconThemeData,
        elevation: 3,
        title: Text(ConstantesApp.i.tituloHome),
        titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
            color: ColorsApp.i.white,
            fontSize: ConstantesApp.i.tamanhoFonteAppBarHome.toDouble()),
      ),
      drawer: getDrawerCustom(),
      body: Form(
        child: SingleChildScrollView(child: getListViewDadosCompras()),
      ),
    );
  }
}
