// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/dog_provider.dart';
import 'screens/dog_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DogProvider()), // Inicializa tu proveedor de perros
        // Otros providers según sea necesario
      ],
      child: MaterialApp(
        title: 'Flutter Dog List Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DogListScreen(), // Pantalla principal de la lista de perros
      ),
    );
  }
}
