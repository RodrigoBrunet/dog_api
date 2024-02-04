import 'package:dog_api/controller/api_controller.dart';
import 'package:dog_api/domain/models/dog.dart';
import 'package:dog_api/presenter/components/dog_list_item_component.dart';
import 'package:flutter/material.dart';

class ListDogsScreen extends StatefulWidget {
  const ListDogsScreen({super.key});

  @override
  State<ListDogsScreen> createState() => _ListDogsScreenState();
}

class _ListDogsScreenState extends State<ListDogsScreen> {
  ApiController apiController = ApiController();
  late Future<List<Dog>> _dogList;

  @override
  void initState() {
    super.initState();
    _dogList = apiController.getListAllDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
      ),
      body: FutureBuilder<List<Dog>>(
        future: _dogList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading dog breeds'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No dog breeds available'),
            );
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return DogListItemComponent(dog: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
