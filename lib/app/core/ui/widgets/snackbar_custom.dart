import 'package:flutter/material.dart';

import 'package:ilista_compras_app/app/utils/enums_app.dart';

import '../styles/colors_app.dart';

class SnackbarCustom extends SnackBar {
  final TipoMensagem tipoMensagem = TipoMensagem.informacaoMensagem;
  final String titulo = '';

  final Color cordefundo = ColorsApp.i.black;

  SnackbarCustom(
      {super.key,
      required super.content,
      required TipoMensagem tipoMensagem,
      required String titulo,
      required Color cordefundo});

  Widget build(BuildContext context) {
    Color getColorByEnumMensagem(TipoMensagem enummensagem) {
      Color cor;
      if (enummensagem == TipoMensagem.erroMensagem) {
        cor = Colors.red;
      } else {
        cor = ColorsApp.i.white;
      }
      return cor;
    }

    getIconByEnum(TipoMensagem tipomensagem) {
      if (tipomensagem == TipoMensagem.informacaoMensagem) {
        return Icons.info;
        //   color: getColorByEnumMensagem(tipomensagem),
        // );
      }
      if (tipomensagem == TipoMensagem.erroMensagem) {
        return Icons.error;
      }
      if (tipomensagem == TipoMensagem.perguntaMensagem) {
        return Icons.question_answer;
      }
    }

    var snackbarcustom = SnackBar(
      backgroundColor: ColorsApp.i.black,
      content: Row(
        children: [
          Icon(
            (getIconByEnum(tipoMensagem)),
            color: getColorByEnumMensagem(tipoMensagem),
          ),
          Text(
            titulo,
            style: TextStyle(color: ColorsApp.i.white, fontSize: 18),
          )
        ],
        // title: Text(
        //   titulo,
        //   style: TextStyle(color: ColorsApp.i.white, fontSize: 18),
        // ),
        // leading: getIconByEnum(tipoMensagem),
      ),
    );

    return snackbarcustom;
  }

  void showSnackBar(BuildContext context, SnackbarCustom snack) {
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
