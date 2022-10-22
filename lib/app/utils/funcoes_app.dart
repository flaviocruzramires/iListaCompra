import 'package:date_format/date_format.dart';

class FuncoesApp {
  static String formataDataPadraoBR(DateTime date) {
    return formatDate(date, [dd, '/', mm, '/', yyyy]);
  }
}
