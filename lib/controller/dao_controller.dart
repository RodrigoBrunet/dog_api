import 'package:dog_api/data/dao/database.dart';
import 'package:dog_api/data/dao/dog_dao.dart';
import 'package:dog_api/domain/models/dog.dart';
import 'package:dog_api/domain/user_case/dao_workflow.dart';

class DaoController implements DaoWorkFlow {
  Future<DogDao> createDataBase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    final DogDao dogDao = database.dogDao;
    return dogDao;
  }

  @override
  Future<void> deleteDog({required Dog dog}) async {
    final DogDao dogDao = await createDataBase();
    dogDao.removeDog(dog);
  }

  @override
  Future<List<Dog>> getSavedDog() async {
    final DogDao dogDao = await createDataBase();
    return dogDao.getAllDogs();
  }

  @override
  Future<void> saveDog({required Dog dog}) async {
    final DogDao dogDao = await createDataBase();
    dogDao.addDog(dog);
  }
}
