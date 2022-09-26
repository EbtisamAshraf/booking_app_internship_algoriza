import '../../data/model/hotels_model.dart';

abstract class HotelStates {}

class InitialState extends HotelStates {}

class HotelsLoadingState extends HotelStates {}

class HotelsLoadedState extends HotelStates {
  final HotelsModel hotelsModel;

  HotelsLoadedState({required this.hotelsModel});
}

class GetHotelsErrorState extends HotelStates {
  final String error;
  GetHotelsErrorState(this.error);
}

class SearchHotelsLoadingState extends HotelStates {}

class SearchHotelsLoadedState extends HotelStates {
  final HotelsModel hotelsModel;

  SearchHotelsLoadedState({required this.hotelsModel});
}

class SearchHotelsErrorState extends HotelStates {
  final String error;
  SearchHotelsErrorState(this.error);
}
