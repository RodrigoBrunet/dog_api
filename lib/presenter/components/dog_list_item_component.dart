import 'package:dog_api/data/api/data_api.dart';
import 'package:dog_api/domain/models/dog.dart';
import 'package:flutter/material.dart';

class DogListItemComponent extends StatefulWidget {
  final Dog dog;

  const DogListItemComponent({super.key, required this.dog});

  @override
  State<DogListItemComponent> createState() => _DogListItemState();
}

class _DogListItemState extends State<DogListItemComponent> {
  DataApi dataApi = DataApi();
  late Future<String?> _referenceImage;
  @override
  void initState() {
    super.initState();
    _referenceImage = dataApi.fetchReferenceImage(widget.dog.referenceImageId);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
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
                  widget.dog.breed,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
