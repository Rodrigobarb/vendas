import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vendas/componentes/produtos.dart';
import 'package:vendas/telas/telaCarrinho.dart';
import 'package:vendas/utils/listaProdutosar.dart';
import 'package:vendas/utils/listaPromo.dart';

class TelaProdutos extends StatefulWidget {
  final List<ListaProdutos> listaProdutos;
  final List<ListaPromo> listaPromocoes;
  final void Function(List<ListaProdutos>) onCarrinhoConfirmado;

  const TelaProdutos({
    Key? key,
    required this.listaProdutos,
    required this.listaPromocoes,
    required this.onCarrinhoConfirmado,
  }) : super(key: key);

  @override
  _TelaProdutosState createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  List<ListaProdutos> produtosSelecionados = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Limpar a quantidade dos produtos se o usuário pressionar o botão de voltar
        for (var produto in produtosSelecionados) {
          produto.quantidade = 0;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Produtos'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                widget.onCarrinhoConfirmado(produtosSelecionados);
                if (produtosSelecionados.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Deve selecionar um item antes'),
                  ));
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaResumoCompra(
                        listaPromo: listaProdutoPromocao,
                        listaProdutosCarrinho: produtosSelecionados,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
        body: Produtos(
          listaProdutosArg: widget.listaProdutos,
          listaPromocoes: widget.listaPromocoes,
          onProdutoSelecionadoArg: (produto) {
            inspect(produto);
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
      ),
    );
  }
}
