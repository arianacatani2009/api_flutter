// screens/dog_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dog_provider.dart';
import '../models/dog.dart';

class DogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog List'),
      ),
      body: Consumer<DogProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.dogList.isEmpty) {
            return Center(child: Text('No dogs found'));
          }

          return ListView.builder(
            itemCount: provider.dogList.length,
            itemBuilder: (context, index) {
              Dog dog = provider.dogList[index];
              return ListTile(
                leading: dog.imageUrl != null && dog.imageUrl!.isNotEmpty
                    ? Image.network(
                        dog.imageUrl!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return CircularProgressIndicator();
                        },
                        errorBuilder: (context, error, stackTrace) {
                          print('Error loading image: $error');
                          return Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey,
                          );
                        },
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                      ),
                title: Text(dog.name),
                onTap: () {
                  // Navegación a detalle del perro
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DogProvider>(context, listen: false).fetchDogs();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
