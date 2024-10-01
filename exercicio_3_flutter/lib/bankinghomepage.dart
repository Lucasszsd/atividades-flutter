import 'package:flutter/material.dart';

class BankingHomePage extends StatefulWidget {
  @override
  _BankingHomePageState createState() => _BankingHomePageState();
}

class _BankingHomePageState extends State<BankingHomePage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _transacoes = [];

  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();

  void _adicionarTransacao() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        String descricao = _descricaoController.text;
        String valor = _valorController.text;
        _transacoes.add('Descrição: $descricao, Valor: R\$ $valor');
        _descricaoController.clear();
        _valorController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicação Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _descricaoController,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a descrição';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _valorController,
                    decoration: const InputDecoration(labelText: 'Valor'),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _adicionarTransacao,
                    child: const Text('Adicionar Transação'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _transacoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_transacoes[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
