import 'dart:async';

Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    if (DateTime.now().second % 2 == 0) {
      return "Dados carregados com sucesso!";
    } else {
      throw Exception("Erro ao carregar dados.");
    }
  });
}

void main() {
  print("Iniciando a requisição...");
  fetchData().then((data) {
    print(data);
    print("Requisição completa.");
  }).catchError((error) {
    print("Ocorreu um erro: $error");
  });
}