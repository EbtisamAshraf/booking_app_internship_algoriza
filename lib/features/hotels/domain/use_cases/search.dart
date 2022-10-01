import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/search_model.dart';
import 'package:dartz/dartz.dart';
import '../repositories/hotels_repo.dart';


class SearchUseCase {
  final ExploreRepository repository;
  SearchUseCase(this.repository);
  Future<Either<Failure,SearchModel>> call({ required SearchParam searchParam}) async {
    return await repository.search(searchParam:searchParam );
  }
}


class SearchParam{
  String? name;
  String? address;
  num? maxPrice;
  num? minPrice;
  Map<String, int>?  facilities;
  double? latitude;
  double? longitude;
  num? distance;
  num? count;
  num? page;

  SearchParam(
      {this.name,
      this.address,
      this.maxPrice,
      this.minPrice,
      this.facilities,
      this.latitude,
      this.longitude,
      this.distance,
      this.count,
      this.page});
}