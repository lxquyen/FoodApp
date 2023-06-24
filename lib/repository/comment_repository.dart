import 'dart:convert';
import 'package:flutter_tutorial/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentRepository {
  Future<List<Comment>> getCommentsFromApi(int start, int limit) async {
    final url = "https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      final json =  jsonDecode(response.body) as List;
      final results = json.map((e){
        return Comment.fromJson(e as Map<String, dynamic>);
      }).toList();
      return  results;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}

Future<List<Comment>> getCommentsFromApi(int start, int limit) async {
  final url = "https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit";
  final uri = Uri.parse(url);
  final http.Client httpClient = http.Client();
  try {
    final response = await httpClient.get(uri);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as List;
      List<Comment> comments = responseData.map((item) => Comment.fromJson(item as Map<String, dynamic>)).toList();
      print(responseData);
      return comments;
    } else {
      return <Comment>[];
    }
  } catch (exception) {
    return <Comment>[];
  }
}
