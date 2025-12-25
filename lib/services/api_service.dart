import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.0.9:3000';

  static Future<List<User>> getUsers() async {
    final res = await http.get(Uri.parse('$baseUrl/users'));
    final List data = jsonDecode(res.body);
    return data.map((e) => User.fromJson(e)).toList();
  }

  static Future<void> addUser(User user) async {
    await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
  }

  static Future<void> updateUser(User user) async {
    await http.put(
      Uri.parse('$baseUrl/users/${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
  }

  static Future<void> deleteUser(int id) async {
    await http.delete(Uri.parse('$baseUrl/users/$id'));
  }
}
