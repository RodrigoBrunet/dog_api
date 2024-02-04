import 'package:dog_api/domain/models/dog.dart';
import 'package:flutter/material.dart';

class DogListItem extends StatelessWidget {
  final Dog dog;
  final VoidCallback onTap;

  DogListItem({required this.dog, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Breed: ${dog.breed}'),
      subtitle: Image.network(
        dog.imageUrl,
        height: 100,
        width: 100,
      ),
      onTap: onTap,
    );
  }
}
