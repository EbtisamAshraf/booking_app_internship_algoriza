import '../../data/model/hotels_model.dart';

abstract class HotelStates {}

class InitialState extends HotelStates {}

class HotelsLoadingState extends HotelStates {}

class HotelsLoadedState extends HotelStates {
  final HotelsModel hotelsModel;

  HotelsLoadedState({required this.hotelsModel});
}

class HotelsDataState extends HotelStates {
  final List<DataHotels> dataHotels;

  HotelsDataState(this.dataHotels);
}

class GetHotelsErrorState extends HotelStates {
  final String error;
  GetHotelsErrorState(this.error);
}
