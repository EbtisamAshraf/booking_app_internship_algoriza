
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/booking_model.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/get_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/update_booking.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {
  Future<Either<Failure, BookingModel>> getBooking({required GetBookingParam getBookingParam});
  Future<Either<Failure, CreateBooking>> createBooking({required CreateBookingParam createBookingParam});
  Future<Either<Failure, CreateBooking>> updateBooking({required UpdateBookingParam updateBookingParam});
}