
import 'package:flutter/material.dart';
import 'package:vendas/componentes/produtos.dart';
import 'package:vendas/telas/telaCarrinho.dart';

class TelaProdutos extends StatefulWidget {
  final List<Produto> listaProdutos;

  const TelaProdutos({Key? key, required this.listaProdutos}) : super(key: key);

  @override
  _TelaProdutosState createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  List<Produto> produtosSelecionados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaCarrinho(
                    listaProdutosCarrinho: produtosSelecionados,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Produtos(
        listaProdutosArg: widget.listaProdutos,
        onProdutoSelecionadoArg: (produto) {
          if (produto.quantidade > 0) {
            if (produtosSelecionados.contains(produto)) {
              produtosSelecionados.remove(produto);
            }
            produtosSelecionados.add(produto);

            setState(() {});
          } else {
            produtosSelecionados.remove(produto);
          }
        },
      ),
    );
  }
}


