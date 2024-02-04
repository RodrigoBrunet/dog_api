import 'dart:convert';

import 'package:dog_api/domain/models/dog.dart';
import 'package:dog_api/utils/constants/api.dart';
import 'package:http/http.dart' as http;

class DataApi {
  var client = http.Client();

  Future<List<Dog>> getListAllDogs() async {
    final response = await http.get(Uri.parse(url));
    final List<dynamic> data = json.decode(response.body);
    var dogs = data.map((item) => Dog.fromJson(item)).toList();
    return dogs;
  }
}
