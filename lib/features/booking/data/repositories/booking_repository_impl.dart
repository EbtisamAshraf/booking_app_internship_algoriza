
 import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/network/network_info.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/data_sources/booking_remote_data_sources.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/booking_model.dart';
import 'package:booking_app_internship_algoriza/features/booking/data/models/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/repositories/booking_repository.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/create_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/get_booking.dart';
import 'package:booking_app_internship_algoriza/features/booking/domain/use_case/update_booking.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/error/exceptions.dart';

class BookingRepositoryImpl implements BookingRepository {

  final BookingRemoteDataSources bookingRemoteDataSources;
  final NetworkInfo networkInfo;

  BookingRepositoryImpl({required this.bookingRemoteDataSources, required this.networkInfo});

  @override
  Future<Either<Failure, CreateBooking>> createBooking({required CreateBookingParam createBookingParam}) async {
    if (await networkInfo.isConnected){
      try {
        final response = await bookingRemoteDataSources.createBooking(createBookingParam: createBookingParam);
        return Right(response);

      }
      on ServerException {
        return Left(ServerFailure());
      } catch (e){

        debugPrint(e.toString());
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, BookingModel>> getBooking({required GetBookingParam getBookingParam}) async{
    if (await networkInfo.isConnected){
      try {
        final response = await bookingRemoteDataSources.getBooking(getBookingParam: getBookingParam);
        return Right(response);

      }
      on ServerException {
        return Left(ServerFailure());
      } catch (e){

        debugPrint(e.toString());
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, CreateBooking>> updateBooking({required UpdateBookingParam updateBookingParam}) async{
    if (await networkInfo.isConnected){
      try {
        final response = await bookingRemoteDataSources.updateBooking(updateBookingParam: updateBookingParam);
        return Right(response);

      }
      on ServerException {
        return Left(ServerFailure());
      } catch (e){

        debugPrint(e.toString());
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}