// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog.dart';

class ApiService {
  static const String baseUrl = 'https://api.thedogapi.com/v1'; // URL base de la API de perros

  static Future<List<Dog>> fetchDogs() async {
    final response = await http.get(Uri.parse('$baseUrl/breeds')); // Endpoint para obtener razas de perros

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      // Mapear los datos a objetos Dog
      List<Dog> dogs = data.map((json) => Dog.fromJson(json)).toList();
      return dogs;
    } else {
      throw Exception('Failed to load dogs');
    }
  }
}
