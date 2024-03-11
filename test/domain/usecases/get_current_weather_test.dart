import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weather.dart';
import 'package:weather_clean_architecture_tdd/domain/usecases/get_current_weather.dart';
import 'package:test/test.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  GetCurrentWeatherUseCase? getCurrentWeatherUseCase;
  MockWeatherRepository? mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepository!);
  });

  String cityName = "New York";
  const testResult = WeatherEntity(
    cityName: "cityName",
    main: "main",
    description: "description",
    iconCode: "iconCode",
    temperature: 300,
    pressure: 300,
    humidity: 10,
  );

  test('should get weather details', () async {
    //arrange
    when(mockWeatherRepository?.getCurrentWeather(cityName))
        .thenAnswer((realInvocation) async {
      return const Right(testResult);
    });
    //act
    final result = await getCurrentWeatherUseCase?.execute(cityName);

    //assert
    expect(result, const Right(testResult));
  });
}
