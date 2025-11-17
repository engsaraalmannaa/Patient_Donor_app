class DoctorBySpecialetyModel {
  int? status;
  String? message;
  List<Data>? data;

  DoctorBySpecialetyModel({this.status, this.message, this.data});

  DoctorBySpecialetyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? fatherName;
  String? lastName;
  int? specialtyId;
  int? id;
  String? imageUrl;
  Specialty? specialty;

  Data(
      {this.firstName,
      this.fatherName,
      this.lastName,
      this.specialtyId,
      this.id,
      this.imageUrl,
      this.specialty});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    fatherName = json['father_name'];
    lastName = json['last_name'];
    specialtyId = json['specialty_id'];
    id = json['id'];
    imageUrl = json['image_url'];
    specialty = json['specialty'] != null
        ? new Specialty.fromJson(json['specialty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['father_name'] = this.fatherName;
    data['last_name'] = this.lastName;
    data['specialty_id'] = this.specialtyId;
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    if (this.specialty != null) {
      data['specialty'] = this.specialty!.toJson();
    }
    return data;
  }
}

class Specialty {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Specialty({this.id, this.name, this.createdAt, this.updatedAt});

  Specialty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
