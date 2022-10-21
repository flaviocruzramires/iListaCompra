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

  int get tamanhoFonteTituloAplicacao => 26;

  int get tamanhoFonteAppBarHome => 22;
}

extension ConstantesAppExtensions on BuildContext {
  ConstantesApp get constantes => ConstantesApp.i;
}
