// ignore_for_file: use_build_context_synchronously

import 'package:dog_api/controller/dao_controller.dart';
import 'package:dog_api/domain/models/new_dog.dart';
import 'package:dog_api/utils/constants/api.dart';
import 'package:dog_api/utils/snack_bar_message.dart';
import 'package:flutter/material.dart';

class DogDetailsComponent extends StatelessWidget {
  final NewDog dog;

  DogDetailsComponent({super.key, required this.dog});

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              '$urlNetwork${dog.referenceImageId}.jpg',
              height: 400,
              width: 400,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            dog.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await daoController.saveDog(dog: dog);
                SnackBarMessageSavedDataBase.showDogSavedSnackbar(context);
              },
              child: const Text(
                'Save to favorite',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
