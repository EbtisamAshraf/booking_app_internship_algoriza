class HotelsModel {
  Status? status;
  HotelDataModel? data;

  HotelsModel({this.status, this.data});

  HotelsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? HotelDataModel.fromJson(json['data']) : null;
  }
}

class Status {
  String? type;

  Status({this.type});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }
}

class HotelDataModel {
  int? currentPage;
  List<DataHotels>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? path;
  String? perPage;
  int? to;
  int? total;

  HotelDataModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  HotelDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataHotels>[];
      json['data'].forEach((v) {
        data!.add(DataHotels.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class DataHotels {
  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;
  String? createdAt;
  String? updatedAt;
  List<String>? hotelImages;
  List<HotelFacilities>? hotelFacilities;

  DataHotels(
      {this.id,
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
      this.hotelFacilities});

  DataHotels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hotelImages = List<String>.from(json['hotel_images'].map((x) => x['image']));
    if (json['hotel_facilities'] != null) {
      hotelFacilities = <HotelFacilities>[];
      json['hotel_facilities'].forEach((v) {
        hotelFacilities!.add(HotelFacilities.fromJson(v));
      });
    }
  }
}

class HotelImages {
  int? id;
  String? hotelId;
  String? image;

  HotelImages({this.id, this.hotelId, this.image});

  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
  }
}

class HotelFacilities {
  int? id;
  String? hotelId;
  String? facilityId;

  HotelFacilities({this.id, this.hotelId, this.facilityId});

  HotelFacilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    facilityId = json['facility_id'];
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
