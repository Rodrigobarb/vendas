import 'package:flutter/material.dart';
import 'package:vendas/utils/listaProdutosar.dart';
import 'package:vendas/utils/listaPromo.dart';

class Produtos extends StatefulWidget {
  final Null Function(dynamic produto) onProdutoSelecionadoArg;
  final List<ListaPromo> listaPromocoes;

  const Produtos({
    Key? key,
    required List<ListaProdutos> listaProdutosArg,
    required this.onProdutoSelecionadoArg,
    required this.listaPromocoes,
  }) : super(key: key);

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listaProdutos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                _mostrarDetalhesProduto(listaProdutos[index]);
              },
              child: buildProdutoItem(listaProdutos[index]));
        },
      ),
    );
  }

  Widget buildProdutoItem(ListaProdutos produto) {
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

    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          produto.nome,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPromocao) SizedBox(height: 4.0),
            if (isPromocao)
              Text(
                'Promoção:  $nomePromocao',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (isPromocao) SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                children: [
                  if (isPromocao)
                    TextSpan(
                      text: 'R\$ ${produto.preco.toStringAsFixed(2)} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  TextSpan(
                    text: 'R\$ ${precoComDesconto.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: isPromocao ? Colors.purple : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isPromocao)
                    TextSpan(
                      text: ' (-${descontoPercentual.toString()}% de Desconto)',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Total: R\$ ${(precoComDesconto * produto.quantidade).toStringAsFixed(2)}',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 16,
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
                    if (produto.quantidade == 0) {
                      widget.onProdutoSelecionadoArg(produto);
                    } else {
                      widget.onProdutoSelecionadoArg(produto);
                    }
                  }
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _mostrarDialogoTrocaQuantidade(produto);
              },
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  produto.quantidade.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            IconButton(
              color: Colors.green,
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  produto.quantidade++;
                  widget.onProdutoSelecionadoArg(produto);
                  widget.onProdutoSelecionadoArg(isPromocao);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDialogoTrocaQuantidade(ListaProdutos produto) {
    showDialog(
      context: context,
      builder: (context) {
        int novaQuantidade = produto.quantidade;
        return AlertDialog(
          title: Text('Escolha a quantidade'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller:
                    TextEditingController(text: novaQuantidade.toString()),
                onChanged: (value) {
                  novaQuantidade = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (novaQuantidade >= 0) {
                  setState(() {
                    produto.quantidade = novaQuantidade;
                    widget.onProdutoSelecionadoArg(produto);
                  });
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('A quantidade não pode ser negativa.'),
                    ),
                  );
                }
              },
              child: Text('Confirmar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDetalhesProduto(ListaProdutos produto) {
    int novaQuantidade = produto.quantidade;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(produto.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://img.freepik.com/psd-gratuitas/modelo-de-midia-social-de-hamburguer-quente-e-picante_505751-2882.jpg?w=740&t=st=1709063678~exp=1709064278~hmac=a94ba5447b6c62caba1604d0b8b2018c10ca87b091c0dbb9b5d98c1774be3f44${produto.idPromo[0]}',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              Text('Preço: R\$ ${produto.preco.toStringAsFixed(2)}'),
              SizedBox(height: 8.0),
              Text(
                  'Ingredientes: ${produto.nome} Pão, Alface, 1 Smash, Queijo ...'),
            ],
          ),
           actions: [
             TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller:
                    TextEditingController(text: novaQuantidade.toString()),
                onChanged: (value) {
                  novaQuantidade = int.tryParse(value) ?? 0;
                },
              ),
            SizedBox(height: 8.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (novaQuantidade >= 0) {
                      setState(() {
                        produto.quantidade = novaQuantidade;
                        widget.onProdutoSelecionadoArg(produto);
                      });
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('A quantidade não pode ser negativa.'),
                        ),
                      );
                    }
                  },
                  child: Text('Confirmar'),
                ),
              SizedBox(width: 10.0),
            
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          
          ],
          ),
           ],
        );
      },
    );
  }
}
