import 'package:dog_api/domain/models/new_dog.dart';

abstract class ApiWorkflow {
  Future<List<NewDog>> getListAllDogs();
}
