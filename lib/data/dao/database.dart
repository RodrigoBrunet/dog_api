import 'dart:async';

import 'package:dog_api/data/dao/new_dog_dao.dart';
import 'package:dog_api/domain/models/new_dog.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [NewDog])
abstract class AppDatabase extends FloorDatabase {
  NewDogDao get newDogDao;
}
