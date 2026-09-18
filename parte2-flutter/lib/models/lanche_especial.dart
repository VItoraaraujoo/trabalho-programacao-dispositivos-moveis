import 'lanche.dart';

class LancheEspecial extends Lanche {
  LancheEspecial({
    required super.nome,
    required super.categoria,
    required super.descricao,
    required super.ano,
    required super.preco,
    required this.molhoDaCasa,
    required this.apimentado,
    super.dataCadastro,
  });

  final String molhoDaCasa;
  final bool apimentado;

  @override
  String ficha() {
    final nivel = apimentado ? 'sim' : 'não';
    return '${super.ficha()} | molho: $molhoDaCasa | apimentado: $nivel';
  }
}
