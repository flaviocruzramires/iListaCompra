import 'package:flutter/material.dart';
import 'package:ilista_compras_app/app/core/ui/styles/text_styles.dart';
import 'package:ilista_compras_app/app/core/ui/styles/button_styles.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:ilista_compras_app/app/core/ui/styles/colors_app.dart';
import 'package:ilista_compras_app/app/core/ui/widgets/button.dart';

class NovaLista extends StatelessWidget {
  const NovaLista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.i.primary,
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        elevation: 3,
        title: Text(ConstantesApp.i.tituloCadastro),
        titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
            color: ColorsApp.i.yellow,
            fontSize: ConstantesApp.i.tamanhoFonteAppBarHome.toDouble()),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Button(
                    //width: MediaQuery.of(context).size.height * .9,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/novalista', (route) => false);
                    },
                    style: ButtonStyles.i.yellowOutLineButton,
                    labelStyle: TextStyles.i.textPrimaryFontBold
                        .copyWith(color: context.colors.yellow),
                    label: '+',
                    outline: false,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Button(
                    //width: MediaQuery.of(context).size.height * .9,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/novalista', (route) => false);
                    },
                    style: ButtonStyles.i.yellowOutLineButton,
                    labelStyle: TextStyles.i.textPrimaryFontBold
                        .copyWith(color: context.colors.yellow),
                    label: 'Ok',
                    outline: false,
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      // controller: nameEC,
                      decoration: const InputDecoration(
                        label: Text(
                          'Nome Completo *',
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 3,
                          color: context.colors.yellowLittle,
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
