part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {

}

class GetBookingLoadingState extends BookingState {}

class GetBookingLoadedState extends BookingState {
  final BookingModel bookingModel;

  const GetBookingLoadedState({required this.bookingModel});
}

class GetBookingErrorState extends BookingState {
  final String error;
  const GetBookingErrorState(this.error);
}


class CreateBookingLoadingState extends BookingState {}

class CreateBookingLoadedState extends BookingState {
  final CreateBooking createBooking;

  const CreateBookingLoadedState({required this.createBooking});
}

class CreateBookingErrorState extends BookingState {
  final String error;
  const CreateBookingErrorState(this.error);
}

class UpdateBookingLoadingState extends BookingState {}

class UpdateBookingLoadedState extends BookingState {
  final CreateBooking updateBooking;

  const UpdateBookingLoadedState({required this.updateBooking});
}

class UpdateBookingErrorState extends BookingState {
  final String error;
  const UpdateBookingErrorState(this.error);
}