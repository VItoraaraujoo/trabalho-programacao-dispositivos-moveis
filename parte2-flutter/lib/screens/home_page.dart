import 'package:flutter/material.dart';
import '../models/cardapio.dart';
import '../models/lanche.dart';
import '../models/lanche_especial.dart';
import 'cadastro_page.dart';
import 'detalhe_page.dart';
import 'widgets/cartao_lanche.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Cardapio _cardapio;

  @override
  void initState() {
    super.initState();
    _cardapio = Cardapio(
      nome: 'Lache do tio joao',
      lanches: [
        Lanche(
          nome: 'X-Tudo do Tio',
          categoria: 'Sanduíche',
          descricao: 'Hambúrguer, queijo, presunto, ovo, bacon e salada.',
          ano: 2026,
          preco: 24.90,
          dataCadastro: DateTime(2026, 8, 20),
        ),
        LancheEspecial(
          nome: 'X-Bacon na Chapa',
          categoria: 'Especial da casa',
          descricao:
              'Bacon crocante, queijo derretido e molho secreto do Tio João.',
          ano: 2026,
          preco: 29.90,
          molhoDaCasa: 'maionese defumada',
          apimentado: false,
          dataCadastro: DateTime(2026, 8, 21),
        ),
        Lanche(
          nome: 'Cachorro-quente Cremoso',
          categoria: 'Hot dog',
          descricao: 'Duas salsichas, purê, milho, batata palha e cheddar.',
          ano: 2026,
          preco: 18.50,
          dataCadastro: DateTime(2026, 8, 22),
        ),
        Lanche(
          nome: 'Misto Quente de Padaria',
          categoria: 'Sanduíche',
          descricao:
              'Pão na chapa, queijo e presunto, do jeito que tem que ser.',
          ano: 2026,
          preco: 12.00,
          dataCadastro: DateTime(2026, 8, 23),
        ),
        LancheEspecial(
          nome: 'Frango Cremoso da Casa',
          categoria: 'Especial da casa',
          descricao: 'Frango desfiado, catupiry, milho e batata palha.',
          ano: 2026,
          preco: 26.50,
          molhoDaCasa: 'creme de alho',
          apimentado: false,
          dataCadastro: DateTime(2026, 8, 24),
        ),
        Lanche(
          nome: 'Batata Crocante da Casa',
          categoria: 'Porção',
          descricao: 'Batata frita com páprica e molho especial.',
          ano: 2026,
          preco: 16.00,
          dataCadastro: DateTime(2026, 8, 25),
        ),
      ],
    );
  }

  Future<void> _abrirCadastro() async {
    final lanche = await Navigator.of(context).push<Lanche>(
      MaterialPageRoute<Lanche>(builder: (context) => const CadastroPage()),
    );

    if (!mounted || lanche == null) {
      return;
    }

    setState(() {
      _cardapio.adicionar(lanche);
    });
  }

  String _formatarPreco(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    const coffee = Color(0xFF2B1712);
    const tomato = Color(0xFFE85C3B);
    const mustard = Color(0xFFF4B642);
    const green = Color(0xFF355C45);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 18,
        title: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: mustard,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LACHE DO TIO JOAO',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'feito na chapa desde 2008',
                  style: TextStyle(fontSize: 11, color: Color(0xFFFFDCA8)),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Adicionar lanche',
            onPressed: _abrirCadastro,
            icon: const Icon(Icons.add_circle_outline),
          ),
          const SizedBox(width: 8),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        backgroundColor: tomato,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Novo lanche'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
              decoration: BoxDecoration(
                color: mustard,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: coffee.withValues(alpha: 0.14),
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x241A0F0B),
                    blurRadius: 14,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CARDÁPIO DE HOJE',
                          style: TextStyle(
                            color: coffee,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 7),
                        const Text(
                          'Bateu a fome?\nChega mais.',
                          style: TextStyle(
                            color: coffee,
                            fontSize: 27,
                            height: 1.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${_cardapio.quantidade} opções saindo quentinhas',
                          style: TextStyle(
                            color: coffee.withValues(alpha: 0.75),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.07,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 11,
                      ),
                      decoration: BoxDecoration(
                        color: tomato,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: coffee, width: 2),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.local_fire_department_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'NA CHAPA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Escolha seu lanche',
                    style: TextStyle(
                      color: coffee,
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: green.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'total ${_formatarPreco(_cardapio.valorTotal)}',
                    style: const TextStyle(
                      color: green,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 2, bottom: 86),
                itemCount: _cardapio.lanches.length,
                itemBuilder: (context, index) {
                  final lanche = _cardapio.lanches[index];
                  return CartaoLanche(
                    lanche: lanche,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => DetalhePage(lanche: lanche),
                        ),
                      );
                    },
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
