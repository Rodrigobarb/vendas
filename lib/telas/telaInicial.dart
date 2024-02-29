import 'package:flutter/material.dart';
import 'package:vendas/telas/telaProdutos.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicial();
}

class _TelaInicial extends State<TelaInicial> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vendas",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white, // Cor de fundo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Toque em Produtos para iniciar",
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaProdutos(
                      listaProdutos: [],
                      onCarrinhoConfirmado: (produtos) {
                        print('Produtos no carrinho: $produtos');
                      },
                      listaPromocoes: [],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Color.fromARGB(174, 214, 0, 238), // Cor do botão
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Produtos",
                style: TextStyle(
                  color: Colors.white, // Cor do texto
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
