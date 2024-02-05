import 'package:floor/floor.dart';

@entity
class NewDog {
  @primaryKey
  final int id;
  final String name;
  final String referenceImageId;

  NewDog({
    required this.id,
    required this.name,
    required this.referenceImageId,
  });

  factory NewDog.fromJson(Map<String, dynamic> json) {
    return NewDog(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      referenceImageId: json['reference_image_id'] ?? '',
    );
  }
}
