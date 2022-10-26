// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:ilista_compras_app/app/core/env/env.dart';
import 'package:ilista_compras_app/app/core/ui/styles/button_styles.dart';
import 'package:ilista_compras_app/app/core/ui/styles/colors_app.dart';
import 'package:ilista_compras_app/app/core/ui/styles/text_styles.dart';
import 'package:ilista_compras_app/app/core/ui/widgets/button.dart';
import 'package:ilista_compras_app/app/models/listagem_compra/compra_model.dart';
import 'package:ilista_compras_app/app/models/usuario/presenter/usuario_presenter.dart';
import 'package:ilista_compras_app/app/models/usuario/usuario.dart';
import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:ilista_compras_app/app/core/ui/widgets/status_tile.dart';
import 'package:ilista_compras_app/app/utils/funcoes_app.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime? dataSelecionada = DateTime.now();

  final dbHelper = DatabaseHelper.instance;

//  static int get length => null;

  Future<void> setDataSelecionada(DateTime date) async {
    dataSelecionada = date;
  }

  DateTime? getDataSelecionada() {
    return dataSelecionada;
  }

  // ignore: non_constant_identifier_names
  // GeraListaCompra aaaaa;
  // aaaaa.Execute();

  // List<String> entries = <String>[
  //   '19/10/2022 - Assai',
  //   '21/10/2022 - Pires',
  //   '25/10/2022 - Mourão'
  // ];
  // List<int> colorsCodes = <int>[600, 500, 100];

  // CompraModel cp1 = CompraModel(
  //     idCompra: 1, dataCompra: '01/01/2021' as DateTime, localCompra: 'Assai');
  // CompraModel cp2 = CompraModel(
  //     idCompra: 2,
  //     dataCompra: '01/02/2021' as DateTime,
  //     localCompra: 'Atacadão');
  // CompraModel cp3 = CompraModel(
  //     idCompra: 3, dataCompra: '01/04/2021' as DateTime, localCompra: 'Assai');

  // ItensCompra ic1 =
  //     ItensCompra(listaCompra: null, quantidade: 30, produto: 'Heineken');

  // final lista = [
  //   CompraModel(idCompra: 1, dataCompra: DateTime.now(), localCompra: 'Assai'),
  //   CompraModel(idCompra: 2, dataCompra: DateTime.now(), localCompra: 'Comper'),
  //   CompraModel(
  //       idCompra: 3, dataCompra: DateTime.now(), localCompra: 'Atacadao'),
  //   CompraModel(idCompra: 4, dataCompra: DateTime.now(), localCompra: 'Comper'),
  // ];

  // Future<Database> db = DatabaseHelper.instance.database;
  // Usuario? usuario;
  // Future<List<Map<String, dynamic>>> queryAllRows() async {
  //   Database db = await DatabaseHelper.instance.database;
  //   return await db.query('usuario');
  // }

  getDadosUsuario() async {
    UsuarioPresenter? usuarioPresenter;
    return await usuarioPresenter?.obterDadosUsuario();
  }

  // Future<void> povoaObjetoDoEnv() async {
  //   usuario!.nomeUsuario = Env.i['nome_usuario'];
  // }

  // Future<void> povoaObjeto() async {
  //   final ds = await queryAllRows();

  //   for (var element in ds) {
  //     usuario!.nomeUsuario = element['nome_usuario'];
  //   }
  // }

  getwidgetDrawer() {
    return Drawer(
      backgroundColor: context.colors.white,
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: context.colors.primary,
          ),
          child: FutureBuilder(
            future: getDadosUsuario(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text(
                    'Nome: ${snapshot.data} ',
                    style: TextStyle(
                        color: context.colors.yellowLittle, fontSize: 24),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: 105,
                    child: Image.asset(
                      'assets/images/flavio_avatar_small.png',
                      fit: BoxFit.cover,
                    ),
                  )
                  // StatusTile(
                  //   icon: Image.asset('assets/images/flavio_avatar_small.png'),
                  //   label: 'Olá ${usuario.nomeUsuario}',
                  //   value: 0,
                  // ),
                ],
              );
            },
          ),
        ),
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
          onTap: (() {}),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Sair'),
          onTap: (() {}),
        ),
      ]),
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
      drawer: getwidgetDrawer(),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3,
                    color: context.colors.primary,
                    child: ListTile(
                      title: Text(
                        'AQUI VAI O BANCO',
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
                        const SnackBar(content: Text('Marcar'));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
