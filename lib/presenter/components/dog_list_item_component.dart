import 'package:dog_api/controller/api_controller.dart';
import 'package:dog_api/controller/dao_controller.dart';
import 'package:dog_api/domain/models/new_dog.dart';
import 'package:flutter/material.dart';

class DogListItemComponent extends StatefulWidget {
  final NewDog dog;
  final bool isFavorite;
  const DogListItemComponent(
      {super.key, required this.dog, required this.isFavorite});

  @override
  State<DogListItemComponent> createState() => _DogListItemState();
}

class _DogListItemState extends State<DogListItemComponent> {
  ApiController apiController = ApiController();
  DaoController daoController = DaoController();
  late Future<String?> _referenceImage;
  @override
  void initState() {
    super.initState();
    _referenceImage =
        apiController.dataApi.fetchReferenceImage(widget.dog.referenceImageId);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Dismissible(
        direction: widget.isFavorite
            ? DismissDirection.endToStart
            : DismissDirection.none,
        key: ValueKey<int>(widget.dog.id),
        onDismissed: (direction) {
          daoController.deleteDog(dog: widget.dog);
        },
        child: Row(
          children: [
            FutureBuilder<String?>(
              future: _referenceImage,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError || snapshot.data == null) {
                  return const SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text('Error loading reference image'),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.dog.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
