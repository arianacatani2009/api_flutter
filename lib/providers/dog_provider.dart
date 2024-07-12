// providers/dog_provider.dart

import 'package:flutter/material.dart';
import '../models/dog.dart';
import '../services/api_service.dart';

class DogProvider extends ChangeNotifier {
  List<Dog> _dogList = [];
  bool _isLoading = false;

  List<Dog> get dogList => _dogList;
  bool get isLoading => _isLoading;

  Future<void> fetchDogs() async {
    _isLoading = true;
    notifyListeners();

    try {
      _dogList = await ApiService.fetchDogs();
    } catch (e) {
      print('Error fetching dogs: $e');
      // Maneja el error según sea necesario
    }

    _isLoading = false;
    notifyListeners();
  }
}
