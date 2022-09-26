import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/end_points.dart';
import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/explore_use_cases.dart';

abstract class ExploreRemoteDataSource {
  Future<HotelsModel> getHotels({required ExploreHotel exploreHotel});
  Future<HotelsModel> search({required SearchParam searchParam});
}

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  ApiConsumer apiConsumer;
  ExploreRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<HotelsModel> getHotels({required ExploreHotel exploreHotel}) async {
    final response = await apiConsumer.get(
      EndPoints.hotels,
      queryParameters: {
        'page': exploreHotel.page,
        'count': 10,
      },
    ).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final HotelsModel hotelResponse = HotelsModel.fromJson(response);
    debugPrint(hotelResponse.toString());
    return hotelResponse;
  }

  @override
  Future<HotelsModel> search({required SearchParam searchParam}) async {
    final response = await apiConsumer.get(
      EndPoints.search,
      queryParameters: {
        'name':searchParam.name,
        'address':searchParam.address,
        'max_price':searchParam.maxPrice,
        'min_price':searchParam.minPrice,
        'facilities':searchParam.facilities,
        'latitude':searchParam.latitude,
        'longitude':searchParam.longitude,
        'distance':searchParam.distance,
        'count':searchParam.count,
        'page':searchParam.page
      },
    ).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final HotelsModel hotelResponse = HotelsModel.fromJson(response);
    debugPrint(hotelResponse.toString());
    return hotelResponse;
  }
}
