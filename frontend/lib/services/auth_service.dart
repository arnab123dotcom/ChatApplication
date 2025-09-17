import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = "http://127.0.0.1:8000";

  Future<bool> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/auth/signup"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print("Sign Up Failed: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error during sign up: $e");
      return false;
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/auth/signin"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        print("Sign in Successful: ${response.body}");
        return true;
      } else {
        print("Sign in Failed: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error during sign in: $e");
      return false;
    }
  }
}
