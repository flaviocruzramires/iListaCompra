import 'package:flutter/material.dart';
import 'package:ilista_compras_app/app/core/ui/styles/colors_app.dart';

class ConfiguracoesApp extends StatefulWidget {
  const ConfiguracoesApp({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesApp> createState() => _ConfiguracoesAppState();
}

class _ConfiguracoesAppState extends State<ConfiguracoesApp> {
  @override
  Widget build(BuildContext context) {
    bool temaEscuro = true;
    return Scaffold(
      backgroundColor: ColorsApp.i.greyDark,
      appBar: AppBar(
        backgroundColor: ColorsApp.i.greyDark,
        title: Text(
          'Configurações',
          style: TextStyle(color: ColorsApp.i.white, fontSize: 20),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.brush,
                  color: ColorsApp.i.white,
                ),
                Text(
                  'Tema Escuro',
                  style: TextStyle(
                    color: ColorsApp.i.white,
                    fontSize: 22,
                  ),
                ),
                Switch(
                  value: temaEscuro,
                  activeColor: ColorsApp.i.yellowLittle,
                  onChanged: (bool value) {
                    setState(
                      () {
                        temaEscuro = value;
                      },
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.backup,
                  color: ColorsApp.i.white,
                ),
                Text('Salvar Automatico Compras',
                    style: TextStyle(
                      color: ColorsApp.i.white,
                      fontSize: 22,
                    )),
                Icon(
                  Icons.battery_full_outlined,
                  color: ColorsApp.i.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
