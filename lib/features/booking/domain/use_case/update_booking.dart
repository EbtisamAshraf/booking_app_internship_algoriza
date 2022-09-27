import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateBookingUseCase {
  final BookingRepository repository;
  UpdateBookingUseCase(this.repository);
  Future<Either<Failure, CreateBooking>> call({required UpdateBookingParam updateBookingParam}) async {
    return await repository.updateBooking(updateBookingParam:updateBookingParam );
  }
}

class UpdateBookingParam {

  int? bookingId;
  String? type;

  UpdateBookingParam({this.bookingId, this.type});
}
