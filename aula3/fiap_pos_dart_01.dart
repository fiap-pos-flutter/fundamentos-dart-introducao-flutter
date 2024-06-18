import 'dart:async';

Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Dados carregados!";
  });
}

void main() async {
  print("Iniciando a requisição...");
  String data = await fetchData();
  print(data);
  print("Requisição completa.");
}