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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TelaProdutos(
                            listaProdutos: [],
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 8, 118, 169), // Cor do botão
              ),
              child: Text(
                "Produtos",
                style: TextStyle(
                  color: Colors.white, // Cor do texto
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
