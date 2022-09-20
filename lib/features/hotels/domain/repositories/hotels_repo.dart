import 'package:booking_app_internship_algoriza/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../data/model/hotels_model.dart';
import '../use_cases/explore_use_cases.dart';

abstract class ExploreRepository {
  Future<Either<Failure, HotelsModel>> getHotels(
      {required ExploreHotel exploreHotel});
}
