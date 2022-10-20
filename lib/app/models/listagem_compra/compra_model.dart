import 'dart:convert';

class CompraModel {
  int? idCompra;
  DateTime? dataCompra;
  String? localCompra;
  CompraModel({
    this.idCompra,
    this.dataCompra,
    this.localCompra,
  });

  Map<String, dynamic> toMap() {
    return {
      'idCompra': idCompra,
      'dataCompra': dataCompra?.millisecondsSinceEpoch,
      'localCompra': localCompra,
    };
  }

  factory CompraModel.fromMap(Map<String, dynamic> map) {
    return CompraModel(
      idCompra: map['idCompra']?.toInt(),
      dataCompra: map['dataCompra'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataCompra'])
          : null,
      localCompra: map['localCompra'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompraModel.fromJson(String source) =>
      CompraModel.fromMap(json.decode(source));
}
