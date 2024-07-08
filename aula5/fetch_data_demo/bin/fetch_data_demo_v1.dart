import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchPost() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('GET: Title: ${data['title']}');
  } else {
    throw Exception('Failed to load post');
  }
}

Future<void> createPost() async {
  final response = await http.post(
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

Future<void> updatePost(int id) async {
  final response = await http.put(
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

Future<void> deletePost(int id) async {
  final response = await http.delete(
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
  await fetchPost();
  await createPost();
  await updatePost(1);
  await deletePost(1);
}