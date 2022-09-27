// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBooking _$CreateBookingFromJson(Map<String, dynamic> json) =>
    CreateBooking(
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateBookingToJson(CreateBooking instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      type: json['type'] as String?,
      title: json['title'] == null
          ? null
          : Title.fromJson(json['title'] as Map<String, dynamic>),
      bookingId: json['booking_id'] as int?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'booking_id': instance.bookingId,
    };

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      ar: json['ar'] as String?,
      en: json['en'] as String?,
    );

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'ar': instance.ar,
      'en': instance.en,
    };
