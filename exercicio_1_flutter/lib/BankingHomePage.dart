import 'package:flutter/material.dart';

class BankingHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicação Bancária'),
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Conta Corrente'),
              subtitle: Text('Saldo: R\$ 1.500,00'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Poupança'),
              subtitle: Text('Saldo: R\$ 10.000,00'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Cartão de Crédito'),
              subtitle: Text('Fatura: R\$ 500,00'),
            ),
          ),
        ],
      ),
    );
  }
}
