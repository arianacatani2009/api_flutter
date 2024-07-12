// models/dog.dart

class Dog {
  final String name;
  final String? imageUrl;

  Dog({required this.name, this.imageUrl});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      name: json['name'] ?? '',
      imageUrl: json['image_url'] ?? '', // Manejar nulos o URLs vacías aquí
    );
  }
}
