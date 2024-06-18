import 'dart:async';

Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Dados carregados!";
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