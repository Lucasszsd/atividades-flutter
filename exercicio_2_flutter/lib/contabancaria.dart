class ContaBancaria<T> {
  T tipoDeConta;
  double saldo;

  ContaBancaria(this.tipoDeConta, this.saldo);

  void depositar(double valor) {
    saldo += valor;
    print('Depósito de R\$ $valor realizado.');
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
      print('Saque de R\$ $valor realizado.');
    } else {
      print('Saldo insuficiente para saque.');
    }
  }

  @override
  String toString() {
    return 'Tipo de Conta: $tipoDeConta, Saldo: R\$ $saldo';
  }
}
