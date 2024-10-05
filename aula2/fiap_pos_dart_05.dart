class Cliente {
  String nome;
  String email;

  Cliente(this.nome, this.email);

  void detalhesDoCliente() {
    print('Nome: $nome');
    print('Email: $email');
  }
}

class Pedido {
  Cliente cliente;
  List<Produto> itens;
  DateTime data;

  Pedido(this.cliente, this.itens) : data = DateTime.now();

  double calcularTotal() {
    double total = 0;
    for (var item in itens) {
      total += item.preco;
    }
    return total;
  }

  void detalhesDoPedido() {
    print('Cliente: ${cliente.nome}');
    print('Data do Pedido: $data');
    print('Itens:');
    for (var item in itens) {
      print('- ${item.nome}: R\$ ${item.preco}');
    }
    print('Total: R\$ ${calcularTotal()}');
  }
}

class SistemaLoja {
  List<Produto> produtos;
  List<Pedido> pedidos;

  SistemaLoja() : produtos = [], pedidos = [];

  void adicionarProduto(Produto produto) {
    produtos.add(produto);
    print('Produto ${produto.nome} adicionado ao estoque.');
  }

  void realizarPedido(Cliente cliente, List<Produto> itens) {
    Pedido pedido = Pedido(cliente, itens);
    pedidos.add(pedido);
    print('Pedido realizado com sucesso para ${cliente.nome}.');
  }

  void listarProdutos() {
    print('Produtos disponíveis:');
    for (var produto in produtos) {
      produto.detalhesDoProduto();
      print('---');
    }
  }

  void listarPedidos() {
    print('Pedidos realizados:');
    for (var pedido in pedidos) {
      pedido.detalhesDoPedido();
      print('---');
    }
  }
}

void main() {
  Produto produto1 = Produto('Livro', 30.0, 100);
  Eletronico produto2 = Eletronico('Celular', 1000.0, 50, 'Samsung', 24);

  Cliente cliente = Cliente('João Silva', 'joao@example.com');

  SistemaLoja loja = SistemaLoja();

  loja.adicionarProduto(produto1);
  loja.adicionarProduto(produto2);

  loja.listarProdutos();

  loja.realizarPedido(cliente, [produto1, produto2]);

  loja.listarPedidos();
}