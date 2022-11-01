import 'package:flutter/material.dart';
import 'package:ilista_compras_app/app/services/database/dao/compra_dao.dart';
import 'package:validatorless/validatorless.dart';

class CompraForm extends StatefulWidget {
  const CompraForm({Key? key}) : super(key: key);

  @override
  State<CompraForm> createState() => _CompraFormState();
}

class _CompraFormState extends State<CompraForm> {
  CompraDao _dao = CompraDao();

  final TextEditingController _localCompra = TextEditingController();
  final TextEditingController _dataCompra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informe dados da Compra',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
        TextFormField(
          controller: _localCompra,
          decoration: const InputDecoration(
            label: Text(
              'Local da compra *',
            ),
          ),
          validator: Validatorless.required('Campo obrigatório.'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _dataCompra,
          decoration: const InputDecoration(
            label: Text(
              'Data da compra *',
            ),
          ),
          validator: Validatorless.required('Campo obrigatório.'),
        ),
        const SizedBox(
          height: 20,
        ),
      ])),
    );
  }
}
