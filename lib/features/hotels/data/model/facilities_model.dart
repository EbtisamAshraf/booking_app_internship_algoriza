class FacilitiesModel {
  Status? status;
  List<FacilitiesData>? data;

  FacilitiesModel({this.status, this.data});

  FacilitiesModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ?  Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <FacilitiesData>[];
      json['data'].forEach((v) {
        data!.add( FacilitiesData.fromJson(v));
      });
    }
  }

}

class Status {
  String? type;

  Status({this.type});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

}

class FacilitiesData {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  FacilitiesData({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  FacilitiesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}
