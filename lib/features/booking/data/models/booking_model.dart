import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "hotel_id")
  int? hotelId;

  BookingModel({required this.userId, required this.hotelId});

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
