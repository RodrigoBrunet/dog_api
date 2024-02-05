import 'package:dog_api/data/dao/database.dart';
import 'package:dog_api/data/dao/new_dog_dao.dart';
import 'package:dog_api/domain/models/new_dog.dart';
import 'package:dog_api/domain/user_case/dao_workflow.dart';

class DaoController implements DaoWorkFlow {
  Future<NewDogDao> createDataBase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    final NewDogDao newDogDao = database.newDogDao;
    return newDogDao;
  }

  @override
  Future<void> deleteDog({required NewDog dog}) async {
    final NewDogDao dogDao = await createDataBase();
    dogDao.removeDog(dog);
  }

  @override
  Future<List<NewDog>> getSavedDog() async {
    final NewDogDao dogDao = await createDataBase();
    return dogDao.getAllDogs();
  }

  @override
  Future<void> saveDog({required NewDog dog}) async {
    final NewDogDao dogDao = await createDataBase();
    dogDao.addDog(dog);
  }
}
