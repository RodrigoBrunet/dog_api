import 'package:dog_api/domain/models/new_dog.dart';
import 'package:floor/floor.dart';

@dao
abstract class NewDogDao {
  @Query('SELECT * FROM NEWDOG')
  Future<List<NewDog>> getAllDogs();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addDog(NewDog dog);

  @delete
  Future<void> removeDog(NewDog dog);
}
