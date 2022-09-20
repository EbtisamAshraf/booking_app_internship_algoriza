import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/app_interceptors%20.dart';
import 'package:booking_app_internship_algoriza/core/api/dio_consumer.dart';
import 'package:booking_app_internship_algoriza/core/network/network_info.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/repositories/auth_repository.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/login_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/cubit/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/hotels/data/data_sources/explore_remote_data_sources.dart';
import 'features/hotels/data/repository/repo_impl.dart';
import 'features/hotels/domain/repositories/hotels_repo.dart';
import 'features/hotels/domain/use_cases/explore_use_cases.dart';


final sl = GetIt.instance;

Future<void> init() async {
  ///feature
  //bloc
  sl.registerFactory(() => LoginCubit(loginUserUseCase:sl()  ));
  sl.registerFactory(() => RegisterCubit(registerUserUseCase:sl()  ));
  // use case
  sl.registerLazySingleton(() => LoginUserUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
  sl.registerLazySingleton(() => ExploreUseCase(sl()));
 //  //Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      networkInfo: sl(),
      authRemoteDataSource: sl()));

  sl.registerLazySingleton<ExploreRepository>(() => ExploreRepositoryImpl(
      networkInfo: sl(),
      exploreRemoteDataSource: sl()));

 //  // data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<ExploreRemoteDataSource>(
          () => ExploreRemoteDataSourceImpl(apiConsumer: sl()));

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
