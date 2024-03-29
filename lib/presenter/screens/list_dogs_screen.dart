import 'package:dog_api/controller/api_controller.dart';
import 'package:dog_api/domain/models/new_dog.dart';
import 'package:dog_api/presenter/components/dog_details_component.dart';
import 'package:dog_api/presenter/components/dog_list_item_component.dart';
import 'package:dog_api/presenter/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class ListDogsScreen extends StatefulWidget {
  const ListDogsScreen({super.key});

  @override
  State<ListDogsScreen> createState() => _ListDogsScreenState();
}

class _ListDogsScreenState extends State<ListDogsScreen> {
  ApiController apiController = ApiController();
  late Future<List<NewDog>> _dogList;

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
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteScreen(),
                    ));
              },
              icon: const Icon(Icons.bookmark))
        ],
      ),
      body: FutureBuilder<List<NewDog>>(
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
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DogDetailsComponent(
                            dog: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: DogListItemComponent(
                        dog: snapshot.data![index], isFavorite: false));
              },
            );
          }
        },
      ),
    );
  }
}
