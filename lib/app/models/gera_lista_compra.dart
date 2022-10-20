import 'package:ilista_compras_app/app/models/itens_compra/itens_compra.dart';
import 'package:ilista_compras_app/app/models/listagem_compra/compra_model.dart';

class GeraListaCompra {
  static CompraModel? compra;
  static ItensCompra? itensCompra;

  static List<CompraModel>? listaCompras;
  static List<ItensCompra>? listaDeItens;

  GeraListaCompra._();

  List<CompraModel>? get getListaCompras {
    return listaCompras;
  }

  List<ItensCompra>? get getListaDeItens {
    return listaDeItens;
  }

  late Future<List<ItensCompra>> getItensCompra;

  // ignore: non_constant_identifier_names
  static Execute() async {
    //GeraListaCompra();
    CompraModel compraAssai01 = CompraModel(
        idCompra: 1, dataCompra: DateTime.now(), localCompra: 'Assai');
    CompraModel compraAssai02 = CompraModel(
        idCompra: 2, dataCompra: DateTime.now(), localCompra: 'Assai');
    CompraModel compraAssai03 = CompraModel(
        idCompra: 3, dataCompra: DateTime.now(), localCompra: 'Assai');
    CompraModel compraAssai04 = CompraModel(
        idCompra: 4, dataCompra: DateTime.now(), localCompra: 'Assai');
    CompraModel compraAssai05 = CompraModel(
        idCompra: 5, dataCompra: DateTime.now(), localCompra: 'Assai');

    ItensCompra itensCompra0101 = ItensCompra(
        listaCompra: compraAssai01,
        produto: 'Cerveja Heinekem',
        quantidade: 15);

    ItensCompra itensCompra0102 = ItensCompra(
        listaCompra: compraAssai01, produto: 'Picanha', quantidade: 10);

    ItensCompra itensCompra0103 = ItensCompra(
        listaCompra: compraAssai01, produto: 'Sabao em po', quantidade: 1);

    ItensCompra itensCompra0104 = ItensCompra(
        listaCompra: compraAssai01, produto: 'Mandioca', quantidade: 1);

    ItensCompra itensCompra0201 = ItensCompra(
        listaCompra: compraAssai02, produto: 'Maionese', quantidade: 1);

    ItensCompra itensCompra0202 =
        ItensCompra(listaCompra: compraAssai02, produto: 'Pao', quantidade: 1);

    ItensCompra itensCompra0203 = ItensCompra(
        listaCompra: compraAssai02, produto: 'Hamburger', quantidade: 1);

    ItensCompra itensCompra0303 = ItensCompra(
        listaCompra: compraAssai03, produto: 'Macarrao', quantidade: 1);

    ItensCompra itensCompra0302 = ItensCompra(
        listaCompra: compraAssai03, produto: 'Pimentao', quantidade: 1);

    ItensCompra itensCompra0301 = ItensCompra(
        listaCompra: compraAssai03, produto: 'Refrigerante', quantidade: 1);

    ItensCompra itensCompra0401 = ItensCompra(
        listaCompra: compraAssai04, produto: 'Salada', quantidade: 1);

    ItensCompra itensCompra0501 = ItensCompra(
        listaCompra: compraAssai05, produto: 'Feijao', quantidade: 1);

    listaCompras?.add(compraAssai01);
    listaCompras?.add(compraAssai02);
    listaCompras?.add(compraAssai03);
    listaCompras?.add(compraAssai04);
    listaCompras?.add(compraAssai05);

    listaDeItens?.add(itensCompra0101);
    listaDeItens?.add(itensCompra0102);
    listaDeItens?.add(itensCompra0103);
    listaDeItens?.add(itensCompra0104);
    listaDeItens?.add(itensCompra0201);
    listaDeItens?.add(itensCompra0202);
    listaDeItens?.add(itensCompra0203);
    listaDeItens?.add(itensCompra0301);
    listaDeItens?.add(itensCompra0302);
    listaDeItens?.add(itensCompra0303);
    listaDeItens?.add(itensCompra0401);
    listaDeItens?.add(itensCompra0501);
  }
}
