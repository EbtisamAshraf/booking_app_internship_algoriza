import 'package:booking_app_internship_algoriza/features/hotels/data/model/facilities_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/search_model.dart';

import '../../data/model/hotels_model.dart';

abstract class HotelStates {}

class InitialState extends HotelStates {}

class HotelsLoadingState extends HotelStates {}
class SelectFacilityState extends HotelStates {}

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

class SearchHotelsLoadingState extends HotelStates {}

class SearchHotelsLoadedState extends HotelStates {
  final SearchModel searchModel;

  SearchHotelsLoadedState({required this.searchModel});
}

class SearchHotelsErrorState extends HotelStates {
  final String error;
  SearchHotelsErrorState(this.error);
}

class FacilitiesLoadingState extends HotelStates {}
class ChangeFilterState extends HotelStates {}

class FacilitiesLoadedState extends HotelStates {
  final FacilitiesModel facilitiesModel;

  FacilitiesLoadedState({required this.facilitiesModel});
}
class FacilitiesErrorState extends HotelStates {
  final String error;
  FacilitiesErrorState(this.error);
}
class ChangeCheckboxValueState extends HotelStates {}
class InitialChangeCheckboxValueState extends HotelStates {}