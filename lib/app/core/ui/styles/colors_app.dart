import 'package:flutter/widgets.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF2b005b);
  Color get secondary => const Color(0XFFFDCE50);
  Color get yellow => const Color(0XFFFDF310);
  Color get yellowLittle => const Color(0XFFFDF310);
  Color get grey => const Color(0XFFCCCCCC);
  Color get greyDark => const Color(0XFF999999);
  Color get white => const Color(0XFF01FFFF);
  Color get blueLittle => const Color(0XFF01FFFF);
  Color get blueSky => const Color(0XFF01FFFF);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
