import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/facilities_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/search_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:dartz/dartz.dart';
import '../../data/model/hotels_model.dart';
import '../use_cases/explore_use_cases.dart';

abstract class ExploreRepository {
  Future<Either<Failure, HotelsModel>> getHotels({required ExploreHotel exploreHotel});
  Future<Either<Failure, SearchModel>> search({ required SearchParam searchParam});
  Future<Either<Failure, FacilitiesModel>> getFacilities();
}
