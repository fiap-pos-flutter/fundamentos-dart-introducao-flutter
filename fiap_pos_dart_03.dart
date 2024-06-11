class Produto {
  String _nome;
  double _preco;
  int _estoque;

  Produto(this._nome, this._preco, this._estoque);

  String get nome => _nome;
  set nome(String value) => _nome = value;

  double get preco => _preco;
  set preco(double value) => _preco = value;

  int get estoque => _estoque;
  set estoque(int value) => _estoque = value;

  void detalhesDoProduto() {
    print('Nome: $nome');
    print('Preço: R\$ $preco');
    print('Estoque: $estoque unidades');
  }
}

void main() {
  Produto produto = Produto('Livro', 30.0, 100);
  produto.detalhesDoProduto();
  produto.nome = 'Revista';
  produto.detalhesDoProduto();
}