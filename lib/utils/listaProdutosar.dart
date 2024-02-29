  class ListaProdutos{
    final String nome;
    final double preco;
    int quantidade;
    final List<int> idPromo;
    bool isPromocao;

    ListaProdutos({required this.nome, required this.preco, required this.quantidade, required this.idPromo,this.isPromocao = false, });

  }
  List<ListaProdutos> listaProdutos = [
    ListaProdutos(nome: 'Hamburguer', preco: 10.00, quantidade: 0, idPromo: [1] ),
    ListaProdutos(nome: 'Churros', preco: 10.00, quantidade: 0, idPromo: [1]),
    ListaProdutos(nome: 'Nachos', preco: 20.00, quantidade: 0, idPromo: [1]),
    ListaProdutos(nome: 'Maçã', preco: 5.00, quantidade: 0, idPromo: [3]),
    ListaProdutos(nome: 'Donuts', preco: 7.00, quantidade: 0, idPromo: [2]),
    ListaProdutos(nome: 'Coca-Cola', preco: 4.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Agua', preco: 3.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Sushi', preco: 80.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Pastel', preco: 8.00, quantidade: 0, idPromo: [1]),
    ListaProdutos(nome: 'Bolo', preco: 10.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Pudim', preco: 12.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Pizza', preco: 24.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Banana', preco: 3.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Mamão', preco: 5.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Cachorro Quente', preco: 10.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Salada', preco: 5.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Ração Cachorro', preco: 4.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Ração Gato', preco: 4.00, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Cerveja', preco: 3.50, quantidade: 0, idPromo: [0]),
    ListaProdutos(nome: 'Skol Beats', preco: 8.00, quantidade: 0, idPromo: [0]),
  ];
