import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/facilities_model.dart';
import 'package:dartz/dartz.dart';
import '../repositories/hotels_repo.dart';


class GetFacilitiesUseCase {
  final ExploreRepository repository;
  GetFacilitiesUseCase(this.repository);
  Future<Either<Failure,FacilitiesModel>> call() async {
    return await repository.getFacilities();
  }
}