import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:ilista_compras_app/app/core/ui/styles/button_styles.dart';
import 'package:ilista_compras_app/app/core/ui/styles/colors_app.dart';
import 'package:ilista_compras_app/app/core/ui/styles/text_styles.dart';
import 'package:ilista_compras_app/app/core/ui/widgets/button.dart';
import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:ilista_compras_app/app/utils/funcoes_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.i.primary,
      appBar: AppBar(
        title: Text(ConstantesApp.i.tituloAplicacao),
        titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
          color: context.colors.yellowLittle,
          fontSize: ConstantesApp.i.tamanhoFonteTituloAplicacao.toDouble(),
        ),
        backgroundColor: ColorsApp.i.primary,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cesta_de_compras_yellow.png'),
          ),
        ),
        child: Stack(
          children: [
            const SizedBox(
              height: 20,
            ),
            //Text(FuncoesApp.formataDataPadraoBR(DateTime.now())),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .09),
                // ignore: sort_child_properties_last
                child: Button(
                  width: MediaQuery.of(context).size.height * .9,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/home', (route) => false);
                  },
                  style: ButtonStyles.i.yellowOutLineButton,
                  labelStyle: TextStyles.i.textPrimaryFontBold
                      .copyWith(color: context.colors.yellow),
                  label: 'Acesse',
                  outline: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
