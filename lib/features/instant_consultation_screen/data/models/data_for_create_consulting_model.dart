import 'dart:convert';

DataForCreateConsultingModel dataForCreateConsultingModelFromJson(String str) =>
    DataForCreateConsultingModel.fromJson(json.decode(str));

String dataForCreateConsultingModelToJson(DataForCreateConsultingModel data) =>
    json.encode(data.toJson());

class DataForCreateConsultingModel {
  DataForCreateConsultingModel({
    this.status,
    this.message,
    this.allData,
  });

  DataForCreateConsultingModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    allData = json['data'] != null ? AllData.fromJson(json['data']) : null;
  }

  bool? status;
  String? message;
  AllData? allData;

  DataForCreateConsultingModel copyWith({
    bool? status,
    String? message,
    AllData? allData,
  }) =>
      DataForCreateConsultingModel(
        status: status ?? this.status,
        message: message ?? this.message,
        allData: allData ?? this.allData,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (allData != null) {
      map['data'] = allData?.toJson();
    }
    return map;
  }
}

AllData allDataFromJson(String str) => AllData.fromJson(json.decode(str));

String allDataToJson(AllData data) => json.encode(data.toJson());

class AllData {
  AllData({
    this.departments,
    this.vendorsCreateConsultation,
  });

  AllData.fromJson(dynamic json) {
    if (json['departments'] != null) {
      departments = [];
      json['departments'].forEach((v) {
        departments?.add(Departments.fromJson(v));
      });
    }
    vendorsCreateConsultation = json['vendors'] != null
        ? VendorsCreateConsultation.fromJson(
            json['vendors'],
          )
        : null;
  }

  List<Departments>? departments;
  VendorsCreateConsultation? vendorsCreateConsultation;

  AllData copyWith({
    List<Departments>? departments,
    VendorsCreateConsultation? vendorsCreateConsultation,
  }) =>
      AllData(
        departments: departments ?? this.departments,
        vendorsCreateConsultation:
            vendorsCreateConsultation ?? this.vendorsCreateConsultation,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (departments != null) {
      map['departments'] = departments?.map((v) => v.toJson()).toList();
    }
    if (vendorsCreateConsultation != null) {
      map['vendors'] = vendorsCreateConsultation?.toJson();
    }
    return map;
  }
}

VendorsCreateConsultation vendorsCreateConsultationFromJson(String str) =>
    VendorsCreateConsultation.fromJson(json.decode(str));

String vendorsCreateConsultationToJson(VendorsCreateConsultation data) =>
    json.encode(data.toJson());

class VendorsCreateConsultation {
  VendorsCreateConsultation({
    this.currentPage,
    this.lastPage,
    this.dataVendor,
  });

  VendorsCreateConsultation.fromJson(dynamic json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    if (json['data'] != null) {
      dataVendor = [];
      json['data'].forEach((v) {
        dataVendor?.add(DataVendor.fromJson(v));
      });
    }
  }

  int? currentPage;
  int? lastPage;
  List<DataVendor>? dataVendor;

  VendorsCreateConsultation copyWith({
    int? currentPage,
    int? lastPage,
    List<DataVendor>? dataVendor,
  }) =>
      VendorsCreateConsultation(
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        dataVendor: dataVendor ?? this.dataVendor,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['last_page'] = lastPage;
    if (dataVendor != null) {
      map['data'] = dataVendor?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

DataVendor dataVendorFromJson(String str) =>
    DataVendor.fromJson(json.decode(str));

String dataVendorToJson(DataVendor data) => json.encode(data.toJson());

class DataVendor {
  DataVendor({
    this.id,
    this.type,
    this.membership,
    this.name,
    this.gender,
    this.idNumber,
    this.phone,
    this.email,
    this.photo,
  });

  DataVendor.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    membership = json['membership'];
    name = json['name'];
    gender = json['gender'];
    idNumber = json['id_number'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
  }

  int? id;
  String? type;
  String? membership;
  String? name;
  String? gender;
  String? idNumber;
  String? phone;
  String? email;
  String? photo;

  DataVendor copyWith({
    int? id,
    String? type,
    String? membership,
    String? name,
    String? gender,
    String? idNumber,
    String? phone,
    String? email,
    String? photo,
  }) =>
      DataVendor(
        id: id ?? this.id,
        type: type ?? this.type,
        membership: membership ?? this.membership,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        idNumber: idNumber ?? this.idNumber,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        photo: photo ?? this.photo,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['membership'] = membership;
    map['name'] = name;
    map['gender'] = gender;
    map['id_number'] = idNumber;
    map['phone'] = phone;
    map['email'] = email;
    map['photo'] = photo;
    return map;
  }
}

Departments departmentsFromJson(String str) =>
    Departments.fromJson(json.decode(str));

String departmentsToJson(Departments data) => json.encode(data.toJson());

class Departments {
  Departments({
    this.id,
    this.name,
  });

  Departments.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Departments copyWith({
    int? id,
    String? name,
  }) =>
      Departments(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
