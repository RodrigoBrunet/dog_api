import 'package:dog_api/data/api/data_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('DataApi', () {
    late DataApi dataApi;
    late MockClient mockClient;

    setUpAll(() {
      registerFallbackValue(Uri.parse('http://dummy.uri'));
    });

    setUp(() {
      mockClient = MockClient();
      dataApi = DataApi();
      dataApi.client = mockClient;
    });
    test('getListAllDogs | Should return success when HTTP status code == 200',
        () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('[]', 200));

      final result = await dataApi.getListAllDogs();

      expect(result, isA<List>());
    });

    test(
        'getListAllDogs | Should return exception when HTTP status code == 404',
        () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      try {
        await dataApi.getListAllDogs();
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), 'Failed to load dog images');
      }
    });
    test(
        'getListAllDogs | Should return exception when HTTP status code == 500',
        () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Internal Server Error', 500));

      try {
        await dataApi.getListAllDogs();
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), 'Failed to load dog images');
      }
    });
    test(
        'fetchReferenceImage | Should return success when HTTP status code == 200',
        () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(
              '{"url": "https://cdn2.thedogapi.com/images/hMyT4CDXR.jpg"}',
              200));

      final referenceImage = await dataApi.fetchReferenceImage("hMyT4CDXR");

      expect(referenceImage, isA<String>());
      expect(referenceImage,
          equals("https://cdn2.thedogapi.com/images/hMyT4CDXR.jpg"));
    });
    test(
        'fetchReferenceImage | Should return exception when HTTP status code == 404',
        () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      try {
        await dataApi.fetchReferenceImage("dog_id");
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(),
            'Exception: Failed to load reference image for breed: dog_id');
      }
    });
    test(
        'fetchReferenceImage | Should return exception when HTTP status code == 500',
        () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Internal Server Error', 500));

      try {
        await dataApi.fetchReferenceImage("dog_id");
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(),
            'Exception: Failed to load reference image for breed: dog_id');
      }
    });
  });
}
