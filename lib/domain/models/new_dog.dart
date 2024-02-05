class NewDog {
  final String name;
  final String referenceImageId;

  NewDog({
    required this.name,
    required this.referenceImageId,
  });

  factory NewDog.fromJson(Map<String, dynamic> json) {
    return NewDog(
      name: json['name'] ?? 'Unknown',
      referenceImageId: json['reference_image_id'] ?? '',
    );
  }
}
