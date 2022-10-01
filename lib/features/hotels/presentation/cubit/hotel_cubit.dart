import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/facilities_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/search_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/get_facilities.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsCubit extends Cubit<HotelStates> {
  HotelsCubit({required this.getFacilitiesUseCase, required this.searchUseCase,
    required this.exploreUseCase,
  }) : super(InitialState());

  final ExploreUseCase exploreUseCase;
  final SearchUseCase searchUseCase;
  final GetFacilitiesUseCase getFacilitiesUseCase;

  static HotelsCubit get(context) => BlocProvider.of(context);

  HotelsModel? hotelsModel;

  getHotels({required ExploreHotel exploreHotel}) async {
    emit(HotelsLoadingState());
    Either<Failure, HotelsModel> response =
    await exploreUseCase(exploreHotel: exploreHotel);
    emit(response.fold(
          (failure) => GetHotelsErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) => HotelsLoadedState(hotelsModel: data),
    ));
  }
  List facilitiesList =[];
  int? facilitiesInt;
  List<bool> checkboxValueList =  [false,false,false,false,];
  getCheckboxValueList(){
    checkboxValueList.clear();
    List.generate(facilitiesModel.data!.length, (index) =>  checkboxValueList.add(false));
    debugPrint('checkboxValueList = $checkboxValueList');
  }
  int checkboxIndex = 0;
  changeCheckboxValue({required bool value, required int index}){
    emit(InitialChangeCheckboxValueState());
    checkboxValueList[index] = value;
    if(value == true){
      facilitiesInt =facilitiesModel.data![index].id! ;
      facilitiesList.add(facilitiesModel.data![index].id!);
      debugPrint('facilitiesList = $facilitiesList');
    }else{
      facilitiesInt = null ;
      facilitiesList.remove(facilitiesModel.data![index].id!);
      debugPrint('facilitiesList = $facilitiesList');
    }
    emit(ChangeCheckboxValueState());

    return checkboxValueList;
  }

  List<int> selectedFacilities = [];

  void selectFacility(int id) {
    if (selectedFacilities.contains(id)) {
      selectedFacilities.remove(id);
    } else {
      selectedFacilities.add(id);
    }

    emit(SelectFacilityState());
  }
  SearchModel? searchModel;
  search({required SearchParam searchParam}) async {
    emit(SearchHotelsLoadingState());
    Either<Failure, SearchModel> response =
    await searchUseCase(searchParam:searchParam );
    emit(response.fold(
          (failure) => SearchHotelsErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) {
        searchModel = data;
        return SearchHotelsLoadedState(searchModel:  data);
      },
    ));
  }
  late FacilitiesModel  facilitiesModel ;
  getFacilities() async {
    emit(FacilitiesLoadingState());
    Either<Failure, FacilitiesModel> response =
    await getFacilitiesUseCase();
    emit(response.fold(
          (failure) => FacilitiesErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) {
        facilitiesModel = data;
        getCheckboxValueList();
        return FacilitiesLoadedState(facilitiesModel:  data);
      },
    ));
  }

  bool isFilter = false;
  changeFilterState(){
    isFilter = !isFilter;
    emit(ChangeFilterState());
  }
  TextEditingController searchController = TextEditingController();

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
