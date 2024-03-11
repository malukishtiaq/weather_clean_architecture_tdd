// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather_clean_architecture_tdd/data/models/weather_model.dart';

import '../../core/constants/app_urls.dart';
import '../../core/errors/exceptions.dart';

abstract class IWeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class WeatherRemoteDataSource implements IWeatherRemoteDataSource {
  final http.Client client;
  WeatherRemoteDataSource(
    this.client,
  );

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}
