import 'dart:convert';

import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/end_points.dart';
import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/facilities_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/search_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/explore_use_cases.dart';

abstract class ExploreRemoteDataSource {
  Future<HotelsModel> getHotels({required ExploreHotel exploreHotel});
  Future<SearchModel> search({required SearchParam searchParam});
  Future <FacilitiesModel> getFacilities();
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
  Future<SearchModel> search({required SearchParam searchParam}) async {
    final response = await apiConsumer.get(
      EndPoints.search,
      queryParameters: {
        'name':searchParam.name,
        // 'address':searchParam.address,
        // 'max_price':searchParam.maxPrice,
        // 'min_price':searchParam.minPrice,
        ...?searchParam.facilities,
        // 'latitude':searchParam.latitude,
        // 'longitude':searchParam.longitude,
        // 'distance':searchParam.distance,
        'count':searchParam.count,
        'page':searchParam.page
      },
    ).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final SearchModel hotelResponse = SearchModel.fromJson(response);
    debugPrint(hotelResponse.toString());
    return hotelResponse;
  }

  @override
  Future<FacilitiesModel> getFacilities() async{
    final response = await apiConsumer.get(
      EndPoints.getFacilities,).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final FacilitiesModel facilitiesModel = FacilitiesModel.fromJson(response);
    debugPrint(facilitiesModel.toString());
    return facilitiesModel;
  }
}
