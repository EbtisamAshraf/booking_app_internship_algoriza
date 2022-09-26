import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsCubit extends Cubit<HotelStates> {
  HotelsCubit({required this.searchUseCase,
    required this.exploreUseCase,
  }) : super(InitialState());

  final ExploreUseCase exploreUseCase;
  final SearchUseCase searchUseCase;

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

  search({required SearchParam searchParam}) async {
    emit(SearchHotelsLoadingState());
    Either<Failure, HotelsModel> response =
    await searchUseCase(searchParam:searchParam );
    emit(response.fold(
          (failure) => SearchHotelsErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) => SearchHotelsLoadedState(hotelsModel: data),
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
