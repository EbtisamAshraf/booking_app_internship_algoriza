import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:dartz/dartz.dart';
import '../repositories/hotels_repo.dart';

class ExploreUseCase {
  final ExploreRepository repository;

  ExploreUseCase(this.repository);

  Future<Either<Failure, HotelsModel>> call(
      {required ExploreHotel exploreHotel}) async {
    return await repository.getHotels(exploreHotel: exploreHotel);
  }
}

class ExploreHotel {
  final int page;
  

  ExploreHotel({required this.page});
}
