import 'package:dog_api/domain/models/dog.dart';
import 'package:floor/floor.dart';

@dao
abstract class DogDao {
  @Query('SELECT * FROM DOG')
  Future<List<Dog>> getAllDogs();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addDog(Dog dog);

  @delete
  Future<void> removeDog(Dog dog);
}
