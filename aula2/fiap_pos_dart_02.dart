class Produto {
  String nome;
  double preco;
  int estoque;

  Produto(this.nome, this.preco, this.estoque);

  void detalhesDoProduto() {
    print('Nome: $nome');
    print('Preço: R\$ $preco');
    print('Estoque: $estoque unidades');
  }
}

class Eletronico extends Produto {
  String marca;
  int garantiaMeses;

  Eletronico(String nome, double preco, int estoque, this.marca, this.garantiaMeses)
      : super(nome, preco, estoque);

  @override
  void detalhesDoProduto() {
    super.detalhesDoProduto();
    print('Marca: $marca');
    print('Garantia: $garantiaMeses meses');
  }
}

void main() {
  Eletronico eletronico = Eletronico('Celular', 1000.0, 50, 'Samsung', 24);
  eletronico.detalhesDoProduto();
}