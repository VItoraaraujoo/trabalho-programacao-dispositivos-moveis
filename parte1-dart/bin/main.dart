import 'models/cardapio.dart';
import 'models/lanche.dart';
import 'models/lanche_especial.dart';

String formatarPreco(double valor) {
  return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
}

void main() {
  final xTudo = Lanche(
    nome: 'X-Tudo do Tio',
    categoria: 'Sanduíche',
    descricao: 'Hambúrguer, queijo, presunto, ovo, bacon e salada.',
    ano: 2026,
    preco: 24.90,
    dataCadastro: DateTime(2026, 8, 20),
  );

  final xBacon = LancheEspecial(
    nome: 'X-Bacon na Chapa',
    categoria: 'Especial da casa',
    descricao: 'Bacon crocante, queijo derretido e molho secreto do Tio João.',
    ano: 2026,
    preco: 29.90,
    molhoDaCasa: 'maionese defumada',
    apimentado: false,
    dataCadastro: DateTime(2026, 8, 21),
  );

  final hotDog = Lanche(
    nome: 'Cachorro-quente Cremoso',
    categoria: 'Hot dog',
    descricao: 'Duas salsichas, purê, milho, batata palha e cheddar.',
    ano: 2026,
    preco: 18.50,
    dataCadastro: DateTime(2026, 8, 22),
  );

  final cardapio = Cardapio(
    nome: 'Lache do tio joao',
    lanches: [xTudo, xBacon, hotDog],
  );

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print('Lanche: ${xTudo.ficha()}');
  print('Descrição: ${xTudo.descricao} | Cadastro: ${xTudo.dataCadastro.year}');

  print('\n===== [2] HERANÇA =====');
  print('Lanche comum -> ficha: "${xTudo.ficha()}"');
  print('LancheEspecial -> ficha: "${xBacon.ficha()}"');

  print('\n===== [3] COMPOSIÇÃO =====');
  print('Cardápio "${cardapio.nome}" contém ${cardapio.quantidade} lanches:');
  for (final lanche in cardapio.lanches) {
    print('  - ${lanche.nome}');
  }

  print('\n===== [4] ENCAPSULAMENTO =====');
  print(
    'Cardápio "${cardapio.nome}" -> valor total (calculado): '
    '${formatarPreco(cardapio.valorTotal)}',
  );
  final batata = Lanche(
    nome: 'Batata Crocante da Casa',
    categoria: 'Porção',
    descricao: 'Batata frita com páprica e molho especial.',
    ano: 2026,
    preco: 16.00,
  );
  cardapio.adicionar(batata);
  print(
    'Após adicionar "${batata.nome}" (${formatarPreco(batata.preco)}): '
    '${formatarPreco(cardapio.valorTotal)}',
  );
}
