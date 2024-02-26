import 'package:flutter/material.dart';
import 'package:vendas/componentes/produtos.dart' as componentes;

class TelaCarrinho extends StatefulWidget {
  final List<componentes.Produto> listaProdutosCarrinho;

  const TelaCarrinho({Key? key, required this.listaProdutosCarrinho})
      : super(key: key);

  @override
  _TelaCarrinhoState createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  double get valorTotal => widget.listaProdutosCarrinho.fold(
      0,
      (sum, produto) => sum +
          (produto.preco * produto.quantidade));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.listaProdutosCarrinho.length,
              itemBuilder: (context, index) {
                return _buildItemCarrinho(
                    widget.listaProdutosCarrinho[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: R\$ ${valorTotal.toStringAsFixed(2)} '),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCarrinho(componentes.Produto produto) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(produto.nome),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantidade: ${produto.quantidade}',
              style: TextStyle(color: Colors.black),
            ),
            if (produto.isPromocao) SizedBox(height: 4.0), // Adiciona espaçamento
            if (produto.isPromocao)
              Text(
                'Promoção: ${produto.nomePromocao}',
                style: TextStyle(color: Colors.green),
              ),
            if (produto.isPromocao) SizedBox(height: 4.0), // Adiciona espaçamento
        RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: 'R\$ ${produto.preco.toStringAsFixed(2)}',
        style: TextStyle(
          color: produto.isPromocao ? Colors.black : Colors.green,
          decoration: produto.isPromocao
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          fontWeight: produto.isPromocao ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      if (produto.isPromocao)
        TextSpan(
          text: ' R\$ ${produto.preco - (produto.preco * produto.descontoPercentual / 100)}',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      if (produto.isPromocao)
        TextSpan(
          text: ' (-${produto.descontoPercentual.toString()}%)',
          style: TextStyle(color: Colors.red),
        ),
    ],
  ),
),

          ],
        ),
      ),
    );
  }
}
