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
  List<Dog> dogList = [];

  @override
  void initState() {
    super.initState();
    fechAllDogData();
  }

  Future<void> fechAllDogData() async {
    final List<Dog> data = await apiController.getListAllDogs();
    setState(() {
      dogList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Dog Images and Breeds'),
      ),
      body: ListView.builder(
        itemCount: dogList.length,
        itemBuilder: (context, index) {
          return DogListItem(
            dog: dogList[index],
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DogDetailPage(
              //       dog: dogList[index],
              //     ),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
