import 'package:bloc/bloc.dart';
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/booking_model.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/get_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/update_booking.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(
      {required this.createBookingUseCase,
      required this.getBookingUseCase,
      required this.updateBookingUseCase}) : super(BookingInitial());

  final CreateBookingUseCase createBookingUseCase;
  final GetBookingUseCase getBookingUseCase;
  final UpdateBookingUseCase updateBookingUseCase;

  getBooking({required GetBookingParam getBookingParam}) async {
    emit(GetBookingLoadingState());
    Either<Failure, BookingModel> response =
    await getBookingUseCase(getBookingParam:getBookingParam );
    emit(response.fold(
          (failure) => const GetBookingErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) => GetBookingLoadedState(bookingModel:  data),
    ));
  }

  createBooking({required CreateBookingParam createBookingParam}) async {
    emit(CreateBookingLoadingState());
    Either<Failure, CreateBooking> response =
    await createBookingUseCase(createBookingParam:createBookingParam );
    emit(response.fold(
          (failure) => const CreateBookingErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) => CreateBookingLoadedState(createBooking:  data),
    ));
  }
  updateBooking({required UpdateBookingParam updateBookingParam}) async {
    emit(UpdateBookingLoadingState());
    Either<Failure, CreateBooking> response =
    await updateBookingUseCase(updateBookingParam:updateBookingParam );
    emit(response.fold(
          (failure) => const UpdateBookingErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) => UpdateBookingLoadedState(updateBooking: data),
    ));
  }

  String msg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMsg;
      case OfflineFailure:
        return AppStrings.offLineFailureMsg;
      default:
        return AppStrings.unexpectedFailureMsg;
    }
  }

}
