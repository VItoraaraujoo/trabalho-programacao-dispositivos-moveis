import 'package:flutter/material.dart';
import '../models/lanche.dart';
import '../models/lanche_especial.dart';

class DetalhePage extends StatelessWidget {
  const DetalhePage({required this.lanche, super.key});

  final Lanche lanche;

  String _formatarPreco(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  String _formatarData(DateTime data) {
    final dia = data.day.toString().padLeft(2, '0');
    final mes = data.month.toString().padLeft(2, '0');
    return '$dia/$mes/${data.year}';
  }

  @override
  Widget build(BuildContext context) {
    const coffee = Color(0xFF2B1712);
    const tomato = Color(0xFFE85C3B);
    const mustard = Color(0xFFF4B642);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhe do lanche')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(21, 21, 21, 23),
            decoration: BoxDecoration(
              color: coffee,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: mustard, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: mustard,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        lanche.categoria.toUpperCase(),
                        style: const TextStyle(
                          color: coffee,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.local_fire_department_rounded,
                      color: tomato,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  lanche.nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    height: 1.02,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  lanche.descricao,
                  style: const TextStyle(
                    color: Color(0xFFFFE5C0),
                    height: 1.45,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.payments_outlined,
                      color: mustard,
                      size: 21,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatarPreco(lanche.preco),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
          const Text(
            'Detalhes do pedido',
            style: TextStyle(
              color: coffee,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 11),
          _InformacaoLinha(
            icone: Icons.calendar_today_outlined,
            rotulo: 'Ano no cardápio',
            valor: '${lanche.ano}',
          ),
          _InformacaoLinha(
            icone: Icons.event_available_outlined,
            rotulo: 'Cadastrado em',
            valor: _formatarData(lanche.dataCadastro),
          ),
          if (lanche is LancheEspecial) ...[
            _InformacaoLinha(
              icone: Icons.soup_kitchen_outlined,
              rotulo: 'Molho da casa',
              valor: (lanche as LancheEspecial).molhoDaCasa,
            ),
            _InformacaoLinha(
              icone: Icons.whatshot_rounded,
              rotulo: 'Apimentado',
              valor: (lanche as LancheEspecial).apimentado ? 'Sim' : 'Não',
            ),
          ],
        ],
      ),
    );
  }
}

class _InformacaoLinha extends StatelessWidget {
  const _InformacaoLinha({
    required this.icone,
    required this.rotulo,
    required this.valor,
  });

  final IconData icone;
  final String rotulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFCF5),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE8D8BF)),
        ),
        child: Row(
          children: [
            Icon(icone, color: const Color(0xFFE85C3B), size: 21),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                rotulo,
                style: TextStyle(color: Colors.brown.shade500, fontSize: 13),
              ),
            ),
            Flexible(
              child: Text(
                valor,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Color(0xFF2B1712),
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
