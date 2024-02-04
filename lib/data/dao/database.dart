import 'dart:async';
import 'package:dog_api/data/dao/dog_dao.dart';
import 'package:dog_api/domain/models/dog.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Dog])
abstract class AppDatabase extends FloorDatabase {
  DogDao get dogDao;
}
