import 'package:exercicio_1_flutter/contabancaria.dart';
import 'package:exercicio_1_flutter/contacorrente.dart';
import 'package:exercicio_1_flutter/contapoupanca.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Depósito aumenta o saldo da conta', () {
    var contaCorrente = ContaBancaria<ContaCorrente>(ContaCorrente(), 1000.0);
    contaCorrente.depositar(500.0);
    expect(contaCorrente.saldo, equals(1500.0));
  });

  test('Saque diminui o saldo da conta', () {
    var contaPoupanca = ContaBancaria<ContaPoupanca>(ContaPoupanca(), 2000.0);
    contaPoupanca.sacar(500.0);
    expect(contaPoupanca.saldo, equals(1500.0));
  });

  test('Saque não permitido com saldo insuficiente', () {
    var contaCorrente = ContaBancaria<ContaCorrente>(ContaCorrente(), 300.0);
    contaCorrente.sacar(500.0);
    expect(contaCorrente.saldo, equals("300.0"));
  });
}
