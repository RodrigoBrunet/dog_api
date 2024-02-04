import 'package:dog_api/domain/models/dog.dart';

abstract class DaoWorkFlow {
  Future<List<Dog>> getSavedDog();

  Future<void> saveDog({required Dog dog});

  Future<void> deleteDog({required Dog dog});
}
