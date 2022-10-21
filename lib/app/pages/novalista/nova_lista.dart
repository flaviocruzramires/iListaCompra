import 'package:flutter/material.dart';
import 'package:ilista_compras_app/app/core/ui/styles/text_styles.dart';
import 'package:ilista_compras_app/app/core/ui/styles/button_styles.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:ilista_compras_app/app/core/ui/styles/colors_app.dart';
import 'package:ilista_compras_app/app/core/ui/widgets/button.dart';

class NovaLista extends StatefulWidget {
  const NovaLista({super.key});

  @override
  State<NovaLista> createState() => _NovaListaState();
}

class _NovaListaState extends State<NovaLista> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorsApp.i.white,
        appBar: AppBar(
          actions: <Widget>[
            Button(
              style: ButtonStyles.i.yellowOutLineButton,
              labelStyle: context.textStyles.textPrimaryFontBold
                  .copyWith(color: context.colors.yellowLittle),
              label: '<',
              onPressed: (() {
                Navigator.of(context).pushNamed('/home');
              }),
            ),
          ],
          backgroundColor: context.colors.primary,
          elevation: 3,
          title: Center(
            child: Text(
              ConstantesApp.i.tituloCadastro,
            ),
          ),
          titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
            color: ColorsApp.i.yellowLittle,
            fontSize: ConstantesApp.i.tamanhoFonteAppBarHome.toDouble(),
          ),
          bottom: TabBar(
            controller: tabController,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const Tab(icon: Icon(Icons.add_card)),
              const Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: TabBarView(controller: tabController, children: [
          SizedBox(
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            // controller: nameEC,
                            decoration: const InputDecoration(
                              label: Text(
                                'Produto *',
                              ),
                            ),
                            // validator: Validatorless.required('Obrigatório'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // controller: nameEC,
                            decoration: const InputDecoration(
                              label: Text(
                                'Quantidade *',
                              ),
                            ),
                            // validator: Validatorless.required('Obrigatório'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // BoxBorder(
                          //   children:[]
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            child: (ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 3,
                  color: context.colors.yellowSuperLittle,
                  child: ListTile(
                    title: Text(
                      'Lista ${[
                        index
                      ]}', //${lista[index].idCompra} - ${lista[index].dataCompra.toString()} , ${lista[index].localCompra}',
                      style: context.textStyles.textPrimaryFontSemiBold,
                    ),
                    leading: const Icon(Icons.add_task_outlined),
                  ),
                );
              },
            )),
          )
        ]),
      ),
    );
  }
}
