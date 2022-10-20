import 'dart:convert';
import 'package:ilista_compras_app/app/models/listagem_compra/compra_model.dart';

class ItensCompra {
  CompraModel? listaCompra;
  int? quantidade;
  String? produto;
  ItensCompra({
    this.listaCompra,
    this.quantidade,
    this.produto,
  });

  Map<String, dynamic> toMap() {
    return {
      'listaCompra': listaCompra?.toMap(),
      'quantidade': quantidade,
      'produto': produto,
    };
  }

  factory ItensCompra.fromMap(Map<String, dynamic> map) {
    return ItensCompra(
      listaCompra: map['listaCompra'] != null
          ? CompraModel.fromMap(map['listaCompra'])
          : null,
      quantidade: map['quantidade']?.toInt(),
      produto: map['produto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItensCompra.fromJson(String source) =>
      ItensCompra.fromMap(json.decode(source));
}
