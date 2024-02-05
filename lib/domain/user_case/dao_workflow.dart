import 'package:dog_api/domain/models/new_dog.dart';

abstract class DaoWorkFlow {
  Future<List<NewDog>> getSavedDog();

  Future<void> saveDog({required NewDog dog});

  Future<void> deleteDog({required NewDog dog});
}
