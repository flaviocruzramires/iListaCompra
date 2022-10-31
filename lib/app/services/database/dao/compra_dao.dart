import 'package:ilista_compras_app/app/models/listagem_compra/compra_model.dart';
import 'package:ilista_compras_app/app/services/database/database_helper.dart';
import 'package:ilista_compras_app/app/utils/constantes_app.dart';
import 'package:sqflite/sqflite.dart';

class CompraDao {
  Map<String, dynamic> _toMap(CompraModel compra) {
    final Map<String, dynamic> compraMap = Map();
    compraMap[ConstantesApp.i.campoIdTabelaCompras] = compra.idCompra;
    compraMap[ConstantesApp.i.campoDataTabelaCompras] = compra.dataCompra;
    compraMap[ConstantesApp.i.campoLocalTabelaCompras] = compra.localCompra;

    return compraMap;
  }

  List<CompraModel> _toList(List<Map<String, dynamic>> result) {
    final List<CompraModel> compras = [];
    for (Map<String, dynamic> row in result) {
      final CompraModel compra = CompraModel(
        idCompra: row[ConstantesApp.i.campoIdTabelaCompras],
        dataCompra: row[ConstantesApp.i.campoDataTabelaCompras],
        localCompra: row[ConstantesApp.i.campoLocalTabelaCompras],
      );
      compras.add(compra);
    }
    return compras;
  }

  Future<int> incluir(CompraModel compra) async {
    final Database db = await getDataBase();
    Map<String, dynamic> compraMap = _toMap(compra);
    return db.insert(ConstantesApp.i.nomeTabelaCompras, compraMap);
  }

  Future<List<CompraModel>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result =
        await db.query(ConstantesApp.i.nomeTabelaCompras);
    List<CompraModel> compras = _toList(result);
    return compras;
  }
}
