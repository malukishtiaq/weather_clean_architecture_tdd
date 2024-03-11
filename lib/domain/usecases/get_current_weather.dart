// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture_tdd/core/errors/failure.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weather.dart';

import '../repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository repository;
  GetCurrentWeatherUseCase(this.repository);
  Future<Either<Failure, WeatherEntity>> execute(String cityName) async {
    return await repository.getCurrentWeather(cityName);
  }
}
