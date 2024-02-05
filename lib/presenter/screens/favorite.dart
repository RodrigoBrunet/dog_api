import 'package:dog_api/controller/dao_controller.dart';
import 'package:dog_api/domain/models/new_dog.dart';
import 'package:dog_api/presenter/components/dog_details_component.dart';
import 'package:dog_api/presenter/components/dog_list_item_component.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _ListDogsScreenState();
}

class _ListDogsScreenState extends State<FavoriteScreen> {
  DaoController daoController = DaoController();
  late Future<List<NewDog>> _dogList;

  @override
  void initState() {
    super.initState();
    _dogList = daoController.getSavedDog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
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
                    child: DogListItemComponent(dog: snapshot.data![index]));
              },
            );
          }
        },
      ),
    );
  }
}
