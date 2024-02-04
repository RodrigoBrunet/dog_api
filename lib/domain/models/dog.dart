import 'package:floor/floor.dart';

@entity
class Dog {
  @primaryKey
  final int? id;
  final String imageUrl;
  final String breed;

  Dog({required this.imageUrl, required this.breed, this.id});

  factory Dog.fromJson(Map<String, dynamic> json) {
    // Verifica se 'breeds' é nulo ou vazio
    final List<dynamic>? breeds = json['breeds'];
    final String breed =
        breeds?.isNotEmpty == true ? breeds![0]['name'] : 'Unknown';

    return Dog(
      imageUrl: json['url'],
      breed: breed,
    );
  }
}
