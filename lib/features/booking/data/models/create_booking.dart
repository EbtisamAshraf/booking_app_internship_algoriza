import 'package:json_annotation/json_annotation.dart';

part 'create_booking.g.dart';

@JsonSerializable()
class CreateBooking {
  Status? status;

  CreateBooking({required this.status});

  factory CreateBooking.fromJson(Map<String, dynamic> json) => _$CreateBookingFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBookingToJson(this);
}

@JsonSerializable()
class Status {
  String? type;
  Title? title;
  @JsonKey(name: "booking_id")
  int? bookingId;

  Status({required this.type, required this.title, required this.bookingId});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}


@JsonSerializable()
class Title {
  String? ar;
  String? en;

  Title({required this.ar, required this.en});

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}
