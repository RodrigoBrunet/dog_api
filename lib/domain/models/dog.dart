import 'package:floor/floor.dart';

@entity
class Dog {
  @primaryKey
  final int? id;
  final String imageUrl;
  final String breed;

  Dog({required this.imageUrl, required this.breed, this.id});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      imageUrl: json['url'],
      breed: json['breeds'].isEmpty ? 'Unknown' : json['breeds'][0]['name'],
    );
  }
}
