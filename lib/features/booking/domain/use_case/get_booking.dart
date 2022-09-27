import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/booking_model.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

class GetBookingUseCase {
  final BookingRepository repository;
  GetBookingUseCase(this.repository);
  Future<Either<Failure, BookingModel>> call(
      {required GetBookingParam getBookingParam}) async {
    return await repository.getBooking(getBookingParam: getBookingParam);
  }
}

class GetBookingParam {
  String? type;
  int? count;
}
