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

Future<void> fetchPost(CustomHttpClient client) async {
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('GET: Title: ${data['title']}');
  } else {
    throw Exception('Failed to load post');
  }
}

Future<void> createPost(CustomHttpClient client) async {
  final response = await client.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': 'foo',
      'body': 'bar',
      'userId': '1',
    }),
  );

  if (response.statusCode == 201) {
    var data = jsonDecode(response.body);
    print('POST: Created Post: ${data['id']}');
  } else {
    throw Exception('Failed to create post');
  }
}

Future<void> updatePost(CustomHttpClient client, int id) async {
  final response = await client.put(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': id.toString(),
      'title': 'foo updated',
      'body': 'bar updated',
      'userId': '1',
    }),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('PUT: Updated Post: ${data['id']}');
  } else {
    throw Exception('Failed to update post');
  }
}

Future<void> deletePost(CustomHttpClient client, int id) async {
  final response = await client.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    print('DELETE: Deleted Post: $id');
  } else {
    throw Exception('Failed to delete post');
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