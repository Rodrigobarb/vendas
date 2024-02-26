import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  final Null Function(dynamic produto) onProdutoSelecionadoArg;

  const Produtos({
    Key? key,
    required List<Produto> listaProdutosArg,
    required this.onProdutoSelecionadoArg,
  }) : super(key: key);

  @override
  State<Produtos> createState() => _ProdutosState();
}
class Produto {
  final List<int> id;
  final String nome;
  final double preco;
  int quantidade;
  bool isPromocao;
  double descontoPercentual;
  String nomePromocao;

  Produto(this.id, this.nome, this.preco, this.quantidade,
      {this.isPromocao = false, this.descontoPercentual = 0.0, this.nomePromocao = ''});
}



class _ProdutosState extends State<Produtos> {
  List<Produto> listaProdutos = [
    Produto([1],'Hamburguer', 14.00, 0),
    Produto([2],'Churros', 10.00, 0),
    Produto([3],'Nachos', 20.00, 0),
    Produto([4],'Maçã', 5.00, 0),
    Produto([5],'Donuts', 7.00, 0),
    Produto([6],'Coca-Cola', 4.00, 0),
    Produto([7],'Agua', 3.00, 0),
    Produto([8],'Sushi', 80.00, 0),
    Produto([9],'Pastel', 8.00, 0),
    Produto([10],'Bolo', 10.00, 0),
    Produto([11],'Pudim', 12.00, 0),
    Produto([12],'Pizza', 24.00, 0),
    Produto([13],'Banana', 3.00, 0),
    Produto([14],'Mamão', 5.00, 0),
    Produto([15],'Cachorro Quente', 10.00, 0),
    Produto([16],'Salada', 5.00, 0),
    Produto([17],'Ração Cachorro', 4.00, 0),
    Produto([18],'Ração Gato', 4.00, 0),
    Produto([19],'Cerveja', 3.50, 0),
    Produto([20],'Skol Beats', 8.00, 0),

  ];

    List<Produto> listaPromocoes = [
   Produto([1,2,3,9,15], "DESCONTAÇO DE LANCHES RADICAL", 10.0,  0),
   Produto([4,13,14], "SUPER PROMOÇÃO DE FRUTAS :D", 20.0,  0),
   Produto([5,10,11], "O CONFEITEIRO FICOU MALUCO!!!!", 15.0,  0),
   Produto([7,6,20], "TÁ COM SEDE PARCEIRO? TOMA UM GOLE!", 14.0,  0),
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
  bool isPromocao = false;
  double precoComDesconto = produto.preco;
  double descontoPercentual = 0.0;
  String nomePromocao = '';

  // Verifica se o produto está associado a alguma promoção
  for (var promocao in listaPromocoes) {
    if (promocao.id.contains(produto.id[0])) {
      isPromocao = true;
      descontoPercentual = promocao.preco;
      precoComDesconto = produto.preco - (produto.preco * descontoPercentual / 100);
      nomePromocao = promocao.nome;
      break;
    }
  }

  return Card(
    margin: EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(produto.nome, style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w400),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quantidade: ${produto.quantidade}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal, // Adiciona negrito
            ),
          ),
          if (isPromocao)
            SizedBox(height: 4.0), // Adiciona espaçamento
          if (isPromocao)
            Text('Promoção: $nomePromocao',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold, // Adiciona negrito
              ),
            ),
          if (isPromocao)
            SizedBox(height: 4.0), // Adiciona espaçamento
          RichText(
            text: TextSpan(
              children: [
                if (isPromocao)
                  TextSpan(
                    text: 'R\$ ${produto.preco.toStringAsFixed(2)} ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold, // Adiciona negrito
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                TextSpan(
                  text: 'R\$ ${precoComDesconto.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: isPromocao ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold, // Adiciona negrito
                  ),
                ),
                if (isPromocao)
                  TextSpan(
                    text: ' (-${descontoPercentual.toString()}%)',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold, // Adiciona negrito
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            color: Colors.red,
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (produto.quantidade > 0) {
                  produto.quantidade--;

                  // Notifique sobre a remoção apenas se a quantidade for zero
                  if (produto.quantidade == 0) {
                    widget.onProdutoSelecionadoArg(produto);
                  } else {
                    // Se a quantidade não for zero, atualize a lista normalmente
                    widget.onProdutoSelecionadoArg(produto);
                  }
                }
              });
            },
          ),
          Text(
            produto.quantidade.toString(),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // Adiciona negrito
            ),
          ),
          IconButton(
            color: Colors.green,
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                produto.quantidade++;
                widget.onProdutoSelecionadoArg(produto);
              });
            },
          ),
        ],
      ),
    ),
  );
}
}