class Lanche {
  Lanche({
    required this.nome,
    required this.categoria,
    required this.descricao,
    required this.ano,
    required this.preco,
    DateTime? dataCadastro,
  }) : dataCadastro = dataCadastro ?? DateTime.now();

  final String nome;
  final String categoria;
  final String descricao;
  final int ano;
  final double preco;
  final DateTime dataCadastro;

  String ficha() {
    return '$nome | $categoria | $ano | ${_formatarPreco(preco)}';
  }

  String _formatarPreco(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
