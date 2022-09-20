// import 'package:booking_app_internship_algoriza/core/error/failures.dart';
// import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
// import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
// import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// part 'hotel_states.dart';
// class HotelsCubit extends Cubit<HotelStates> {
//   HotelsCubit({
//     required this.exploreUseCase,
//
//   }) : super(InitialState());
//
//   final ExploreUseCase exploreUseCase;
//
//   static HotelsCubit get(context) => BlocProvider.of(context);
//
//   late final HotelsModel hotelsModel;
//
//   getHotels({required ExploreHotel exploreHotel}) async{
//     emit(HotelsLoadingState());
//     Either<Failure, HotelsModel> response = await exploreUseCase(exploreHotel: exploreUseCase);
//     emit(response.fold(
//           (failure) => GetHotelsErrorState(
//         AppStrings.loginErrorMsg,
//       ),
//           (data) => HotelsLoadedState(hotelsModel:data),
//     ));
//
//   }
//
//   String msg(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return AppStrings.serverFailureMsg;
//       case OfflineFailure:
//         return AppStrings.offLineFailureMsg;
//       default:
//         return AppStrings.unexpectedFailureMsg;
//     }
//   }
// }
