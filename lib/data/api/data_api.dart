import 'dart:convert';

import 'package:dog_api/domain/models/dog.dart';
import 'package:dog_api/utils/constants/api.dart';
import 'package:http/http.dart' as http;

class DataApi {
  var client = http.Client();

  Future<List<Dog>> fechDogData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Dog.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load dogApi');
    }
  }
}
