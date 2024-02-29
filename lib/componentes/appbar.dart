import 'package:flutter/material.dart';
import 'package:vendas/telas/telaInicial.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedsColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const TelaInicial(),
    );
  }
}