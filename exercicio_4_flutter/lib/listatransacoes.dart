import 'package:flutter/material.dart';

class ListaTransacoesPage extends StatefulWidget {
  final List<Map<String, String>> transacoes;

  ListaTransacoesPage({required this.transacoes});

  @override
  _ListaTransacoesPageState createState() => _ListaTransacoesPageState();
}

class _ListaTransacoesPageState extends State<ListaTransacoesPage> {
  void _removerTransacao(int index) {
    setState(() {
      widget.transacoes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Transações'),
      ),
      body: ListView.builder(
        itemCount: widget.transacoes.length,
        itemBuilder: (context, index) {
          final transacao = widget.transacoes[index];
          return Card(
            child: ListTile(
              title: Text(transacao['descricao'] ?? ''),
              subtitle: Text('Valor: R\$ ${transacao['valor'] ?? ''}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removerTransacao(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
