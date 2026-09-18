import 'package:flutter/material.dart';
import '../models/lanche.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _precoController.dispose();
    super.dispose();
  }

  String? _validarTexto(String? valor, String campo) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Informe $campo';
    }
    return null;
  }

  String? _validarPreco(String? valor) {
    final texto = valor?.trim().replaceAll(',', '.') ?? '';
    final preco = double.tryParse(texto);
    if (preco == null || preco <= 0) {
      return 'Informe um preço válido';
    }
    return null;
  }

  void _confirmarCadastro() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final lanche = Lanche(
      nome: _nomeController.text.trim(),
      categoria: 'Novidade da chapa',
      descricao: _descricaoController.text.trim(),
      ano: DateTime.now().year,
      preco: double.parse(_precoController.text.trim().replaceAll(',', '.')),
    );

    Navigator.of(context).pop(lanche);
  }

  @override
  Widget build(BuildContext context) {
    const coffee = Color(0xFF2B1712);
    const tomato = Color(0xFFE85C3B);
    const mustard = Color(0xFFF4B642);

    return Scaffold(
      appBar: AppBar(title: const Text('Novo lanche')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: mustard,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.receipt_long_rounded, color: coffee, size: 30),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Coloque uma novidade no cardápio.',
                      style: TextStyle(
                        color: coffee,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 23),
            Text(
              'Cadastro rápido',
              style: const TextStyle(
                color: coffee,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Só o essencial. O Tio João resolve o resto na cozinha.',
              style: TextStyle(color: Colors.brown.shade500, height: 1.4),
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: _nomeController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nome do lanche',
                prefixIcon: Icon(Icons.lunch_dining_outlined),
              ),
              validator: (valor) => _validarTexto(valor, 'o nome'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _descricaoController,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Descrição curta',
                prefixIcon: Icon(Icons.notes_rounded),
              ),
              validator: (valor) => _validarTexto(valor, 'a descrição'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _precoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Preço',
                hintText: 'Ex.: 24,90',
                prefixIcon: Icon(Icons.payments_outlined),
              ),
              validator: _validarPreco,
            ),
            const SizedBox(height: 26),
            FilledButton.icon(
              onPressed: _confirmarCadastro,
              style: FilledButton.styleFrom(
                backgroundColor: tomato,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.add_task_rounded),
              label: const Text(
                'Colocar no cardápio',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
