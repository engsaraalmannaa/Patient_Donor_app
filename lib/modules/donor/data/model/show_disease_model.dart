class ShowDiseaseModel {
  int? status;
  String? message;
  Data? data;

  ShowDiseaseModel({this.status, this.message, this.data});

  ShowDiseaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? specialtyId;
  int? doctorId;
  int? patientId;
  String? patientStatus;
  int? availableMoney;
  int? neededAmount;
  int? collectedAmount;
  String? urgencyLevel;
  String? finalTime;
  String? donationStatus;
  String? createdAt;
  String? updatedAt;
  int? isShown;

  Data(
      {this.id,
      this.specialtyId,
      this.doctorId,
      this.patientId,
      this.patientStatus,
      this.availableMoney,
      this.neededAmount,
      this.collectedAmount,
      this.urgencyLevel,
      this.finalTime,
      this.donationStatus,
      this.createdAt,
      this.updatedAt,
      this.isShown});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialtyId = json['specialty_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    patientStatus = json['patient_status'];
    availableMoney = json['available_money'];
    neededAmount = json['needed_amount'];
    collectedAmount = json['collected_amount'];
    urgencyLevel = json['urgency_level'];
    finalTime = json['final_time'];
    donationStatus = json['donation_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isShown = json['is_shown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['specialty_id'] = this.specialtyId;
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['patient_status'] = this.patientStatus;
    data['available_money'] = this.availableMoney;
    data['needed_amount'] = this.neededAmount;
    data['collected_amount'] = this.collectedAmount;
    data['urgency_level'] = this.urgencyLevel;
    data['final_time'] = this.finalTime;
    data['donation_status'] = this.donationStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_shown'] = this.isShown;
    return data;
  }
}
