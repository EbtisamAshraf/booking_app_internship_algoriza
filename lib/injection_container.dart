import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/app_interceptors%20.dart';
import 'package:booking_app_internship_algoriza/core/api/dio_consumer.dart';
import 'package:booking_app_internship_algoriza/core/app_cubit.dart';
import 'package:booking_app_internship_algoriza/core/network/network_info.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/repositories/auth_repository.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/login_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/cubit/register_cubit.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/data_sources/booking_remote_data_sources.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/repositories/booking_repository_impl.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/repositories/booking_repository.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/get_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/update_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/get_facilities.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/repositories/profile_repository.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/get_profile_info.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/cubit/profile_cubit.dart';
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
  ///feature --------------- hotel ---------------
  //bloc
  sl.registerFactory(() => HotelsCubit(getFacilitiesUseCase: sl(), exploreUseCase: sl(),searchUseCase: sl()));
  //use case
  sl.registerLazySingleton(() => ExploreUseCase(sl()));
  sl.registerLazySingleton(() => SearchUseCase(sl()));
  sl.registerLazySingleton(() => GetFacilitiesUseCase(sl()));
  //Repository
  sl.registerLazySingleton<ExploreRepository>(() => ExploreRepositoryImpl(
      networkInfo: sl(),
      exploreRemoteDataSource: sl()));
  // data source
  sl.registerLazySingleton<ExploreRemoteDataSource>(
          () => ExploreRemoteDataSourceImpl(apiConsumer: sl()));

  ///feature --------------- profile ---------------
  //bloc
  // sl.registerFactory(() => ProfileCubit( getProfileInfoUseCase: sl() ,));


  // use case


  //  //Repository

  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
      networkInfo: sl(),
      profileRemoteDataSource: sl()));

  //  // data source
  sl.registerLazySingleton<ProfileRemoteDataSource>(
          () => ProfileRemoteDataSourceImpl(apiConsumer: sl()));

  ///feature --------------- auth ---------------
  //bloc
  sl.registerFactory(() => LoginCubit(loginUserUseCase:sl()  ));
  sl.registerFactory(() => RegisterCubit(registerUserUseCase:sl()  ));
  // use case
  sl.registerLazySingleton(() => LoginUserUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));

 //  //Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      networkInfo: sl(),
      authRemoteDataSource: sl()));

 //  // data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));


  ///feature --------------- Booking ---------------
  //bloc
  sl.registerFactory(() => BookingCubit(
   createBookingUseCase: sl() ,
   getBookingUseCase: sl(),
   updateBookingUseCase:sl() ));


  // use case
  sl.registerLazySingleton(() => CreateBookingUseCase(sl()));
  sl.registerLazySingleton(() => GetBookingUseCase(sl()));
  sl.registerLazySingleton(() => UpdateBookingUseCase(sl()));
  //  //Repository

  sl.registerLazySingleton<BookingRepository>(() => BookingRepositoryImpl(
      networkInfo: sl(),
      bookingRemoteDataSources: sl(),
      ));

  //  // data source
  sl.registerLazySingleton<BookingRemoteDataSources>(
          () => BookingRemoteDataSourcesImpl(apiConsumer: sl()));

  /// ---------------------------------------------------------------------------
  // core
    sl.registerFactory(() => AppCubit(sl(), sl()));
     sl.registerLazySingleton<NetworkInfo>(
         () => NetworkInfoImpl(connectionChecker: sl()));
     // use case
  sl.registerLazySingleton(() => UpdateInfoUseCase(sl()));
  sl.registerLazySingleton(() => GetProfileInfoUseCase(sl()));
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
