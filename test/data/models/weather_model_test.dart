import 'dart:convert';

import 'package:test/test.dart';
import 'package:weather_clean_architecture_tdd/data/models/weather_model.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weather.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
    cityName: 'New York',
    main: 'Clear',
    description: 'clear sky',
    iconCode: '01n',
    temperature: 292.87,
    pressure: 1012,
    humidity: 70,
  );

  test('weather model is a weather entity', () {
    expect(testWeatherModel, isA<WeatherEntity>());
  });

  test('weather model is json model', () async {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_weather_response.json'));

    //act
    WeatherModel result = WeatherModel.fromJson(jsonMap);

    //assert
    expect(result, testWeatherModel);
  });

  test('should return a json map containing proper data', () async {
    //arrange

    //act
    final result = testWeatherModel.toJson();

    //assert
    final expectedJsonMap = {
      'weather': [
        {
          'main': 'Clear',
          'description': 'clear sky',
          'icon': '01n',
        }
      ],
      'main': {
        'temp': 292.87,
        'pressure': 1012,
        'humidity': 70,
      },
      'name': 'New York',
    };
    expect(result, expectedJsonMap);
  });
}
