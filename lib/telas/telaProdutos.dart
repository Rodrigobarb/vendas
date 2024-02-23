import 'package:flutter/material.dart';
import 'package:vendas/componentes/produtos.dart';

class TelaProdutos extends StatefulWidget {
  const TelaProdutos({Key? key}) : super(key: key);

  @override
  _TelaProdutosState createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Lógica para abrir a tela do carrinho
              print('Botão de Carrinho Pressionado');
            },
          ),
        ],
      ),
      body: Produtos(),
    );
  }
}
