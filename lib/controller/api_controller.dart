import 'package:dog_api/data/api/data_api.dart';
import 'package:dog_api/domain/models/new_dog.dart';
import 'package:dog_api/domain/user_case/api_workflow.dart';

class ApiController implements ApiWorkflow {
  DataApi dataApi = DataApi();

  @override
  Future<List<NewDog>> getListAllDogs() async {
    return dataApi.getListAllDogs();
  }
}
