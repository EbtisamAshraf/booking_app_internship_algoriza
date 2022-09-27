import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/network/network_info.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/facilities_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/search_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/hotels_repo.dart';
import '../data_sources/explore_remote_data_sources.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDataSource exploreRemoteDataSource;
  final NetworkInfo networkInfo;

  ExploreRepositoryImpl(
      {required this.exploreRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, HotelsModel>> getHotels(
      {required ExploreHotel exploreHotel}) async {
    if (await networkInfo.isConnected) {
      try {
        final hotels =
            await exploreRemoteDataSource.getHotels(exploreHotel: exploreHotel);
        return Right(hotels);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        debugPrint(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, SearchModel>> search({required SearchParam searchParam})async {
    if (await networkInfo.isConnected) {
      try {
        final hotels =
            await exploreRemoteDataSource.search(searchParam: searchParam);
        return Right(hotels);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        debugPrint(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, FacilitiesModel>> getFacilities() async {
    if (await networkInfo.isConnected) {
      try {
        final facilities =
            await exploreRemoteDataSource.getFacilities();
        return Right(facilities);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        debugPrint(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
