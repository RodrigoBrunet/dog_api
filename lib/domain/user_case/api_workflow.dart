import 'package:dog_api/domain/models/dog.dart';

abstract class ApiWorkflow {
  Future<List<Dog>> getListAllDogs();
}
