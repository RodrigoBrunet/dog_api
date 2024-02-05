import 'dart:convert';
import 'package:dog_api/domain/models/new_dog.dart';
import 'package:dog_api/utils/constants/api.dart';
import 'package:http/http.dart' as http;

class DataApi {
  var client = http.Client();

  Future<List<NewDog>> getListAllDogs() async {
    final response = await http.get(
      Uri.parse(urlBreeds),
      headers: {
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .where((item) =>
              item['name'] != null && item['reference_image_id'] != null)
          .map((item) => NewDog.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load dog images');
    }
  }

  Future<String?> fetchReferenceImage(String breedId) async {
    final response = await http.get(
      Uri.parse("$urlImageId$breedId"),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return data['url'];
    } else {
      throw Exception('Failed to load reference image for breed: $breedId');
    }
  }
}
