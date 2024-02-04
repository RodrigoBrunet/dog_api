import 'package:dog_api/data/api/data_api.dart';
import 'package:dog_api/domain/models/dog.dart';
import 'package:dog_api/domain/user_case/api_workflow.dart';

class ApiController implements ApiWorkflow {
  DataApi dataApi = DataApi();

  @override
  Future<List<Dog>> getListAllDogs() async {
    return dataApi.getListAllDogs();
  }
}
