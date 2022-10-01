

class SearchModel {
  SearchModel({
    required this.status,
    required this.data,
  });

  Status status;
  Data data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: Status.fromJson(json["status"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  Data({
     this.currentPage,
     this.data,
     this.firstPageUrl,
     this.from,
     this.lastPage,
     this.lastPageUrl,
     this.links,
     this.nextPageUrl,
     this.path,
     this.perPage,
     this.prevPageUrl,
     this.to,
     this.total,
  });

  int? currentPage;
  List<DataSearch>? data;
  dynamic firstPageUrl;
  int? from;
  int? lastPage;
  dynamic lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  dynamic path;
  dynamic perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<DataSearch>.from(json["data"].map((x) => DataSearch.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class DataSearch {
  DataSearch({
     this.id,
     this.name,
     this.description,
     this.price,
     this.address,
     this.longitude,
     this.latitude,
     this.rate,
     this.createdAt,
     this.updatedAt,
     this.hotelImages,
     this.facilities,
  });

  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Facility>? hotelImages;
  List<Facility>? facilities;

  factory DataSearch.fromJson(Map<String, dynamic> json) => DataSearch(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    address: json["address"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    rate: json["rate"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    hotelImages: List<Facility>.from(json["hotel_images"].map((x) => Facility.fromJson(x))),
    facilities: List<Facility>.from(json["facilities"].map((x) => Facility.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "rate": rate,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "hotel_images": List<dynamic>.from(hotelImages!.map((x) => x.toJson())),
    "facilities": List<dynamic>.from(facilities!.map((x) => x.toJson())),
  };
}

class Facility {
  Facility({
     this.id,
     this.name,
     this.image,
     this.createdAt,
     this.updatedAt,
     this.hotelId,
  });

  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  var hotelId;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
    id: json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    hotelId: json["hotel_id"] == null ? null : json["hotel_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? null : name,
    "image": image,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "hotel_id": hotelId == null ? null : hotelId,
  };
}

class Link {
  Link({
     this.url,
     this.label,
     this.active,
  });

  var url;
  var label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}

class Status {
  Status({
     this.type,
  });

  var type;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}
