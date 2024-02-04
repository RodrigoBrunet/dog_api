import 'package:floor/floor.dart';

@entity
class Dog {
  @primaryKey
  final int? id;
  final String breed;
  final String referenceImageId;
  late final String referenceImage;

  Dog({
    required this.breed,
    required this.referenceImageId,
    this.id,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      breed: json['name'] ?? 'Unknown',
      referenceImageId: json['reference_image_id'] ?? '',
    );
  }
}
