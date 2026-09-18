import 'package:flutter/material.dart';
import '../../models/lanche.dart';

class CartaoLanche extends StatelessWidget {
  const CartaoLanche({required this.lanche, required this.onTap, super.key});

  final Lanche lanche;
  final VoidCallback onTap;

  IconData _iconeDaCategoria() {
    final categoria = lanche.categoria.toLowerCase();
    if (categoria.contains('hot')) {
      return Icons.lunch_dining_rounded;
    }
    if (categoria.contains('porção')) {
      return Icons.fastfood_rounded;
    }
    if (categoria.contains('especial')) {
      return Icons.local_fire_department_rounded;
    }
    return Icons.bakery_dining_rounded;
  }

  String _formatarPreco(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    const coffee = Color(0xFF2B1712);
    const tomato = Color(0xFFE85C3B);

    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCF5),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE8D8BF), width: 1.4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 9,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(17),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE2B6),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFF4B642),
                      width: 1.5,
                    ),
                  ),
                  child: Icon(_iconeDaCategoria(), color: tomato, size: 26),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              lanche.nome,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: coffee,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _formatarPreco(lanche.preco),
                            style: const TextStyle(
                              color: tomato,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        lanche.descricao,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.brown.shade400,
                          fontSize: 12,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFF4B642,
                              ).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              lanche.categoria.toUpperCase(),
                              style: const TextStyle(
                                color: coffee,
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'ver detalhes  ›',
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
