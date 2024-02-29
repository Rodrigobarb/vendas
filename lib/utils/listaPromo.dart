 class ListaPromo{
  final String nomePromocao;
  final double desconto;
  final List<int> idPromo;

  ListaPromo({required this.nomePromocao, required this.desconto, required this.idPromo});
 }
 
 List<ListaPromo> listaProdutoPromocao = [
    // ListaPromo(nomePromocao: "", desconto: 0.0, idPromo: [0]),
    ListaPromo(nomePromocao: "DESCONTAÇO DE LANCHES NA HORA!", desconto: 10.0, idPromo: [1]),
    ListaPromo(nomePromocao: "SUPER PROMOÇÃO DE FRUTAS...", desconto: 20.0, idPromo: [2]),
    ListaPromo(nomePromocao: "O DOCEIRO FICOU MALUCO!!!!", desconto: 15.0, idPromo:[3]),
    ListaPromo(nomePromocao: "TÁ COM SEDE PARCEIRO?!", desconto:15.0, idPromo:[4]),
  ];
 