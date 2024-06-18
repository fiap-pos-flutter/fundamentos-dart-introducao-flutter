import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('Resposta: ${response.body}');
  } else {
    print('Falha na requisição: ${response.statusCode}');
  }
}