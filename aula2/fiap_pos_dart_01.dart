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

void main() {
  Produto produto = Produto('Livro', 30.0, 100);
  produto.detalhesDoProduto();
}