import 'lanche.dart';

class Cardapio {
  Cardapio({required this.nome, List<Lanche>? lanches})
    : _lanches = List<Lanche>.from(lanches ?? const []);

  final String nome;
  final List<Lanche> _lanches;

  List<Lanche> get lanches => List.unmodifiable(_lanches);

  int get quantidade => _lanches.length;

  double get valorTotal =>
      _lanches.fold(0, (total, lanche) => total + lanche.preco);

  void adicionar(Lanche lanche) {
    _lanches.add(lanche);
  }
}
