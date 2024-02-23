import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({Key? key}) : super(key: key);

  @override
  State<Produtos> createState() => _ProdutosState();
}

class Produto {
  final String nome;
  final String descricao;
  int quantidade;

  Produto(this.nome, this.descricao, this.quantidade);
}

class _ProdutosState extends State<Produtos> {
  List<Produto> listaProdutos = [
    Produto('Hamburguer', 'R\$5,00', 0),
    Produto('Churros', 'R\$ 7,00', 0),
    Produto('Nachos', 'R\$ 3,00', 0),
    Produto('Maçã', 'R\$5,00', 0),
    Produto('Downie', 'R\$ 7,00', 0),
    Produto('Coca-Cola', 'R\$ 3,00', 0),
    Produto('Agua', 'R\$5,00', 0),
    Produto('Sushi', 'R\$ 7,00', 0),
    Produto('Pastel', 'R\$ 3,00', 0),
    Produto('Bolo', 'R\$5,00', 0),
    Produto('Pudim', 'R\$ 7,00', 0),
    Produto('Pizza', 'R\$ 3,00', 0),
    Produto('Banana', 'R\$5,00', 0),
    Produto('Mamão', 'R\$ 7,00', 0),
    Produto('Cachorro Quente', 'R\$ 3,00', 0),
    Produto('Salada', 'R\$5,00', 0),
    Produto('Cachorro', 'R\$ 7,00', 0),
    Produto('Gato', 'R\$ 3,00', 0),
    // Adicione mais itens conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listaProdutos.length,
        itemBuilder: (context, index) {
          return _buildProdutoItem(listaProdutos[index]);
        },
      ),
    );
  }

  Widget _buildProdutoItem(Produto produto) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(produto.nome),
        subtitle: Text('${produto.descricao} - Quantidade: ${produto.quantidade}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                // Lógica para remover quantidade ao pressionar o botão
                setState(() {
                  if (produto.quantidade > 0) {
                    produto.quantidade--;
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Lógica para adicionar quantidade ao pressionar o botão
                setState(() {
                  produto.quantidade++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
