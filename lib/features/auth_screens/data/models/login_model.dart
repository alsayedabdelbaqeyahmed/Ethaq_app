import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataLoginModel.fromJson(json['data']) : null;
  }

  bool? status;
  String? message;
  DataLoginModel? data;

  LoginModel copyWith({
    bool? status,
    String? message,
    DataLoginModel? data,
  }) =>
      LoginModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

DataLoginModel dataFromJson(String str) => DataLoginModel.fromJson(json.decode(str));

String dataToJson(DataLoginModel data) => json.encode(data.toJson());

class DataLoginModel {
  DataLoginModel({
    this.token,
    this.user,
  });

  DataLoginModel.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String? token;
  User? user;

  DataLoginModel copyWith({
    String? token,
    User? user,
  }) =>
      DataLoginModel(
        token: token ?? this.token,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.type,
    this.membership,
    this.name,
    this.gender,
    this.idNumber,
    this.idEnd,
    this.phone,
    this.phoneVerifyAt,
    this.email,
    this.emailVerifiedAt,
    this.photo,
    this.cityName,
    this.cityId,
    this.countryId,
    this.occupationId,
    this.qualificationId,
    this.specialtyId,
    this.birthdate,
    this.address,
    this.companyName,
    this.companyNumber,
    this.contract,
    this.isActive,
    this.notes,
    this.currentBalance,
    this.suspendedBalance,
    this.yearsOfExperience,
    this.bankAccount,
    this.bio,
    this.createdAt,
    this.updatedAt,
    this.lastSeen,
    this.isBlock,
    this.consultingRequestId,
    this.vendorConsultingTotalEvaluate,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    membership = json['membership'];
    name = json['name'];
    gender = json['gender'];
    idNumber = json['id_number'];
    idEnd = json['id_end'];
    phone = json['phone'];
    phoneVerifyAt = json['phone_verify_at'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    photo = json['photo'];
    cityName = json['city_name'];
    cityId = json['city_id'];
    countryId = json['country_id'];
    occupationId = json['occupation_id'];
    qualificationId = json['qualification_id'];
    specialtyId = json['specialty_id'];
    birthdate = json['birthdate'];
    address = json['address'];
    companyName = json['company_name'];
    companyNumber = json['company_number'];
    contract = json['contract'];
    isActive = json['is_active'];
    notes = json['notes'];
    currentBalance = json['current_balance'];
    suspendedBalance = json['suspended_balance'];
    yearsOfExperience = json['years_of_experience'];
    bankAccount = json['bank_account'];
    bio = json['bio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastSeen = json['last_seen'];
    isBlock = json['is_block'];
    consultingRequestId = json['consulting_request_id'];
    vendorConsultingTotalEvaluate = json['VendorConsultingTotalEvaluate'];
  }

  num? id;
  String? type;
  String? membership;
  String? name;
  String? gender;
  String? idNumber;
  String? idEnd;
  String? phone;
  String? phoneVerifyAt;
  String? email;
  String? emailVerifiedAt;
  String? photo;
  String? cityName;
  num? cityId;
  num? countryId;
  num? occupationId;
  num? qualificationId;
  num? specialtyId;
  String? birthdate;
  String? address;
  String? companyName;
  String? companyNumber;
  String? contract;
  num? isActive;
  String? notes;
  num? currentBalance;
  num? suspendedBalance;
  num? yearsOfExperience;
  String? bankAccount;
  String? bio;
  String? createdAt;
  String? updatedAt;
  String? lastSeen;
  num? isBlock;
  num? consultingRequestId;
  num? vendorConsultingTotalEvaluate;

  User copyWith({
    num? id,
    String? type,
    String? membership,
    String? name,
    String? gender,
    String? idNumber,
    String? idEnd,
    String? phone,
    String? phoneVerifyAt,
    String? email,
    String? emailVerifiedAt,
    String? photo,
    String? cityName,
    num? cityId,
    num? countryId,
    num? occupationId,
    num? qualificationId,
    num? specialtyId,
    String? birthdate,
    String? address,
    String? companyName,
    String? companyNumber,
    String? contract,
    num? isActive,
    String? notes,
    num? currentBalance,
    num? suspendedBalance,
    num? yearsOfExperience,
    String? bankAccount,
    String? bio,
    String? createdAt,
    String? updatedAt,
    String? lastSeen,
    num? isBlock,
    num? consultingRequestId,
    num? vendorConsultingTotalEvaluate,
  }) =>
      User(
        id: id ?? this.id,
        type: type ?? this.type,
        membership: membership ?? this.membership,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        idNumber: idNumber ?? this.idNumber,
        idEnd: idEnd ?? this.idEnd,
        phone: phone ?? this.phone,
        phoneVerifyAt: phoneVerifyAt ?? this.phoneVerifyAt,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        photo: photo ?? this.photo,
        cityName: cityName ?? this.cityName,
        cityId: cityId ?? this.cityId,
        countryId: countryId ?? this.countryId,
        occupationId: occupationId ?? this.occupationId,
        qualificationId: qualificationId ?? this.qualificationId,
        specialtyId: specialtyId ?? this.specialtyId,
        birthdate: birthdate ?? this.birthdate,
        address: address ?? this.address,
        companyName: companyName ?? this.companyName,
        companyNumber: companyNumber ?? this.companyNumber,
        contract: contract ?? this.contract,
        isActive: isActive ?? this.isActive,
        notes: notes ?? this.notes,
        currentBalance: currentBalance ?? this.currentBalance,
        suspendedBalance: suspendedBalance ?? this.suspendedBalance,
        yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
        bankAccount: bankAccount ?? this.bankAccount,
        bio: bio ?? this.bio,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lastSeen: lastSeen ?? this.lastSeen,
        isBlock: isBlock ?? this.isBlock,
        consultingRequestId: consultingRequestId ?? this.consultingRequestId,
        vendorConsultingTotalEvaluate:
            vendorConsultingTotalEvaluate ?? this.vendorConsultingTotalEvaluate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['membership'] = membership;
    map['name'] = name;
    map['gender'] = gender;
    map['id_number'] = idNumber;
    map['id_end'] = idEnd;
    map['phone'] = phone;
    map['phone_verify_at'] = phoneVerifyAt;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['photo'] = photo;
    map['city_name'] = cityName;
    map['city_id'] = cityId;
    map['country_id'] = countryId;
    map['occupation_id'] = occupationId;
    map['qualification_id'] = qualificationId;
    map['specialty_id'] = specialtyId;
    map['birthdate'] = birthdate;
    map['address'] = address;
    map['company_name'] = companyName;
    map['company_number'] = companyNumber;
    map['contract'] = contract;
    map['is_active'] = isActive;
    map['notes'] = notes;
    map['current_balance'] = currentBalance;
    map['suspended_balance'] = suspendedBalance;
    map['years_of_experience'] = yearsOfExperience;
    map['bank_account'] = bankAccount;
    map['bio'] = bio;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['last_seen'] = lastSeen;
    map['is_block'] = isBlock;
    map['consulting_request_id'] = consultingRequestId;
    map['VendorConsultingTotalEvaluate'] = vendorConsultingTotalEvaluate;
    return map;
  }
}
