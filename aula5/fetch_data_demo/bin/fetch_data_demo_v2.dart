import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomHttpClient extends http.BaseClient {
  final http.Client _httpClient = http.Client();

    @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    print('INTERCEPTOR >> BEFORE >> Request headers: ${request.headers}');

    // Adicione cabeçalhos ou registre solicitações aqui
    request.headers['Custom-Header'] = 'Custom-Value';

    print('INTERCEPTOR >> Request: ${request.method} ${request.url}');
    print('INTERCEPTOR >> AFTER >> Request headers: ${request.headers}');

    return _httpClient.send(request);
  }
}

void main() async {
  var client = CustomHttpClient();
  await fetchPost(client);
  print('\n');

  await createPost(client);
  print('\n');

  await updatePost(client, 1);
  print('\n');

  await deletePost(client, 1);
}