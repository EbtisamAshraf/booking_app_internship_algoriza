import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

class CreateBookingUseCase {
  final BookingRepository repository;
  CreateBookingUseCase(this.repository);
  Future<Either<Failure, CreateBooking>> call({required CreateBookingParam createBookingParam}) async {
    return await repository.createBooking(createBookingParam:createBookingParam );
  }
}
class CreateBookingParam {

  int? userId;
  int? hotelId;

  CreateBookingParam({this.userId, this.hotelId});
}