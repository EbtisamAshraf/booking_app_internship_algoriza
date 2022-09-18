import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/app_interceptors%20.dart';
import 'package:booking_app_internship_algoriza/core/api/dio_consumer.dart';
import 'package:booking_app_internship_algoriza/core/network/network_info.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;

Future<void> init() async {
  ///feature
 //  //bloc
 // sl.registerFactory(() => WeatherCubit(getWeatherUseCase: sl()));
 //  // // use case
 //   sl.registerLazySingleton(() => GetWeatherUseCase(weatherRepository:  sl()));
 //  //Repository
 //
 //  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
 //      networkInfo: sl(),
 //      weatherRemoteDataSource: sl()));
 //
 //  // data source
 //  sl.registerLazySingleton<WeatherRemoteDataSource>(
 //      () => WeatherRemoteDataSourceImpl(apiConsumer: sl()));

  // core
   sl.registerLazySingleton<NetworkInfo>(
       () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  // external

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
   sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
