import 'package:flutter/widgets.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF000000);
  Color get secondary => const Color(0XFFFCFFFE);
  Color get yellow => const Color(0XFFFFFD1A);
  Color get yellowLittle => const Color(0XFFFFFF9A);
  Color get yellowSuperLittle => const Color(0XFFFFFFFA);
  Color get grey => const Color(0XFFCCCCCC);
  Color get greyDark => const Color(0XFF999999);
  Color get blueLittle => const Color(0XFF01FFFF);
  Color get blueSky => const Color(0XFF01FFFF);
  Color get white => const Color(0XFFFCFFFE);
  Color get black => const Color(0XFF000000);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
