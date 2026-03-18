import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8080/api/auth";

  static Future<Map<String, dynamic>> register({
    required String username,
    required String plate,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "username": username,
          "plate": plate,
          "email": email,
          "password": password,
        }),
      );

      print("REGISTER STATUS: ${response.statusCode}");
      print("REGISTER BODY: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          "success": true,
          "message": "Kayıt başarılı",
          "username": username,
          "plate": plate,
        };
      } else {
        return {
          "success": false,
          "message": "Sunucu hata döndürdü: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Backend bağlantısı kurulamadı: $e",
      };
    }
  }

  static Future<Map<String, dynamic>> login({
    required String usernameOrPlate,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "usernameOrPlate": usernameOrPlate,
          "password": password,
        }),
      );

      print("LOGIN STATUS: ${response.statusCode}");
      print("LOGIN BODY: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          "success": true,
          "message": "Giriş başarılı",
          "username": usernameOrPlate,
          "plate": "34ABC123",
        };
      } else {
        return {
          "success": false,
          "message": "Giriş başarısız: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Backend bağlantısı kurulamadı: $e",
      };
    }
  }
}