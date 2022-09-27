import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/end_points.dart';
import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/booking_model.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/get_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/update_booking.dart';
import 'package:flutter/material.dart';

abstract class BookingRemoteDataSources {
  Future<BookingModel> getBooking({required GetBookingParam getBookingParam});
  Future<CreateBooking> createBooking(
      {required CreateBookingParam createBookingParam});
  Future<CreateBooking> updateBooking(
      {required UpdateBookingParam updateBookingParam});
}

class BookingRemoteDataSourcesImpl implements BookingRemoteDataSources {
  ApiConsumer apiConsumer;

  BookingRemoteDataSourcesImpl({required this.apiConsumer});

  @override
  Future<CreateBooking> createBooking({required CreateBookingParam createBookingParam}) async {
    final response = await apiConsumer.post(EndPoints.createBooking,body: {
      'user_id': createBookingParam.userId,
      'hotel_id': createBookingParam.hotelId,
    },
        header: {'token': AppStrings.token}).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final CreateBooking createBooking =
    CreateBooking.fromJson(response);
    debugPrint('data = $createBooking', wrapWidth: 1024);
    return createBooking;
  }

  @override
  Future<BookingModel> getBooking({required GetBookingParam getBookingParam}) async {
    final response = await apiConsumer.get(EndPoints.getBooking,queryParameters: {
      'type': getBookingParam.type,
      'count': getBookingParam.count,
    },
        header: {'token': AppStrings.token}).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final BookingModel bookingModel =
    BookingModel.fromJson(response);
    debugPrint('data = $bookingModel', wrapWidth: 1024);
    return bookingModel;
  }

  @override
  Future<CreateBooking> updateBooking({required UpdateBookingParam updateBookingParam}) async {
    final response = await apiConsumer.post(EndPoints.updateBooking,body: {
      'booking_id': updateBookingParam.bookingId,
      'type': updateBookingParam.type,
    },
      ).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final CreateBooking createBooking =
    CreateBooking.fromJson(response);
    debugPrint('data = $createBooking', wrapWidth: 1024);
    return createBooking;
  }
}
