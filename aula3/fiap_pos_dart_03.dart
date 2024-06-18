import 'dart:async';

Stream<int> generateNumbers() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  print("Iniciando a geração de números...");
  await for (int number in generateNumbers()) {
    print("Número gerado: $number");
  }
  print("Geração de números completa.");
}