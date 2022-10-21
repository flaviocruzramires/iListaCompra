// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:ilista_compras_app/app/core/ui/styles/button_styles.dart';
import 'package:ilista_compras_app/app/core/ui/styles/colors_app.dart';
import 'package:ilista_compras_app/app/core/ui/styles/text_styles.dart';
import 'package:ilista_compras_app/app/core/ui/widgets/button.dart';
import 'package:ilista_compras_app/app/models/listagem_compra/compra_model.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime? dataSelecionada = DateTime.now();

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

  final lista = [
    CompraModel(idCompra: 1, dataCompra: DateTime.now(), localCompra: 'Assai'),
    CompraModel(idCompra: 2, dataCompra: DateTime.now(), localCompra: 'Comper'),
    CompraModel(
        idCompra: 3, dataCompra: DateTime.now(), localCompra: 'Atacadao'),
    CompraModel(idCompra: 4, dataCompra: DateTime.now(), localCompra: 'Comper'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.i.primary,
        appBar: AppBar(
          backgroundColor: context.colors.primary,
          elevation: 3,
          title: Text(ConstantesApp.i.tituloAplicacao),
          titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
              color: ColorsApp.i.yellowLittle,
              fontSize: ConstantesApp.i.tamanhoFonteAppBarHome.toDouble()),
        ),
        drawer: Drawer(
          backgroundColor: context.colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: context.colors.greyDark,
                ),
                child: Text(
                  'Opções',
                  style: TextStyle(
                    color: context.colors.yellowLittle,
                    fontSize: 24,
                  ),
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
            ],
          ),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: lista.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 3,
                      color: context.colors.yellowSuperLittle,
                      child: ListTile(
                        title: Text(
                          'Lista ${lista[index].idCompra} - ${lista[index].dataCompra.toString()} , ${lista[index].localCompra}',
                          style: context.textStyles.textPrimaryFontSemiBold,
                        ),
                        leading: const Icon(Icons.add_task_outlined),
                        selected: true,
                        onTap: () {
                          const SnackBar(content: Text('Marcar'));
                        },
                      ),
                    );
                  },
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Button(
                //     width: MediaQuery.of(context).size.height * .9,
                //     onPressed: () {
                //       Navigator.of(context).pushNamedAndRemoveUntil(
                //           '/novalista', (route) => false);
                //     },
                //     style: ButtonStyles.i.yellowOutLineButton,
                //     labelStyle: TextStyles.i.textPrimaryFontBold
                //         .copyWith(color: context.colors.yellow),
                //     label: 'Nova Lista',
                //     outline: false,
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
