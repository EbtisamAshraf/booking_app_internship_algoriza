
class ProfileInfoModel {
  ProfileInfoModel({
    this.status,
    this.data,
  });

  Status? status;
  Data? data;

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) => ProfileInfoModel(
    status: Status.fromJson(json["status"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status?.toJson(),
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.apiToken,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.googleId,
    this.provider,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? apiToken;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic googleId;
  dynamic provider;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    apiToken: json["api_token"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    googleId: json["google_id"],
    provider: json["provider"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "api_token": apiToken,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "google_id": googleId,
    "provider": provider,
  };
}

class Status {
  Status({
    this.type,
  });

  String? type;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}
