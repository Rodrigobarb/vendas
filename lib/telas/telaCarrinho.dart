import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vendas/componentes/produtos.dart';
import 'package:vendas/utils/listaProdutosar.dart';
import 'package:vendas/utils/listaPromo.dart';

class TelaResumoCompra extends StatelessWidget {
  final List<ListaProdutos> listaProdutosCarrinho;
  final List<ListaPromo> listaPromo;

  const TelaResumoCompra(
      {Key? key, required this.listaProdutosCarrinho, required this.listaPromo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double valorTotal = 0.0;

    for (var i = 0; i < listaProdutosCarrinho.length; i++) {
      valorTotal += (listaProdutosCarrinho[i].preco - (listaProdutosCarrinho[i].preco * listaPromo[i].desconto / 100)) *
          listaProdutosCarrinho[i].quantidade ;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Resumo da Compra'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Itens do Carrinho',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listaProdutosCarrinho.length,
              itemBuilder: (context, index) {
                return _buildItemCarrinho(
                    listaProdutosCarrinho[index], listaPromo[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total: R\$ ${valorTotal.toStringAsFixed(2)} ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCarrinho(ListaProdutos produto, ListaPromo listaPromo) {
    bool isPromocao = false;
    double precoComDesconto = produto.preco;
    double descontoPercentual = 0.0;
    String nomePromocao = '';

    for (var promocao in listaProdutoPromocao) {
      if (promocao.idPromo.contains(produto.idPromo[0])) {
        isPromocao = true;
        descontoPercentual = promocao.desconto;
        precoComDesconto =
            produto.preco - (produto.preco * descontoPercentual / 100);
        nomePromocao = promocao.nomePromocao;
        break;
      }
    }
    double valorTotal = precoComDesconto * produto.quantidade;

    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(produto.nome),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quantidade: ${produto.quantidade}'),
            if (listaPromo.nomePromocao.isNotEmpty) SizedBox(height: 4.0),
            if (listaPromo.nomePromocao.isNotEmpty)
              Text(
                'Promoção: ${listaPromo.nomePromocao}',
                style: TextStyle(color: Colors.purple),
              ),
            if (listaPromo.nomePromocao.isNotEmpty) SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'R\$ ${valorTotal.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: listaPromo.nomePromocao.isNotEmpty
                          ? Colors.purple
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (listaPromo.nomePromocao.isNotEmpty)
                    TextSpan(
                      text: ' (-${listaPromo.desconto.toString()}%)',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
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
