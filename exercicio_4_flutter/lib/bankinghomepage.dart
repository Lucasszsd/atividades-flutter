import 'package:exercicio_4_flutter/listatransacoes.dart';
import 'package:flutter/material.dart';

class BankingHomePage extends StatefulWidget {
  @override
  _BankingHomePageState createState() => _BankingHomePageState();
}

class _BankingHomePageState extends State<BankingHomePage> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _transacoes = [];

  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();

  void _adicionarTransacao() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _transacoes.add({
          'descricao': _descricaoController.text,
          'valor': _valorController.text,
        });
        _descricaoController.clear();
        _valorController.clear();
      });
    }
  }

  void _abrirListaTransacoes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListaTransacoesPage(transacoes: _transacoes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Transação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a descrição';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valorController,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o valor';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe um valor válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _adicionarTransacao,
                child: Text('Adicionar Transação'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _abrirListaTransacoes,
                child: Text('Ver Transações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
