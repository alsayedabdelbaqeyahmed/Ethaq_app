import 'dart:convert';

MyProfileModel myProfileModelFromJson(String str) =>
    MyProfileModel.fromJson(json.decode(str));

String myProfileModelToJson(MyProfileModel data) => json.encode(data.toJson());

class MyProfileModel {
  MyProfileModel({
    this.status,
    this.message,
    this.dataMyProfile,
  });

  MyProfileModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    dataMyProfile = json['data'] != null
        ? DataMyProfile.fromJson(json['data'])
        : null;
  }

  bool? status;
  String? message;
  DataMyProfile? dataMyProfile;

  MyProfileModel copyWith({
    bool? status,
    String? message,
    DataMyProfile? dataMyProfile,
  }) =>
      MyProfileModel(
        status: status ?? this.status,
        message: message ?? this.message,
        dataMyProfile: dataMyProfile ?? this.dataMyProfile,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (dataMyProfile != null) {
      map['data'] = dataMyProfile?.toJson();
    }
    return map;
  }
}

DataMyProfile dataMyProfileFromJson(String str) =>
    DataMyProfile.fromJson(json.decode(str));

String dataMyProfileToJson(DataMyProfile data) => json.encode(data.toJson());

class DataMyProfile {
  DataMyProfile({
    this.userMyProfile,
    this.countries,
    this.cities,
  });

  DataMyProfile.fromJson(dynamic json) {
    userMyProfile = json['user'] != null
        ? UserMyProfile.fromJson(json['user'])
        : null;
    if (json['countries'] != null) {
      countries = [];
      json['countries'].forEach((v) {
        countries?.add(Countries.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = [];
      json['cities'].forEach((v) {
        cities?.add(Cities.fromJson(v));
      });
    }
  }

  UserMyProfile? userMyProfile;
  List<Countries>? countries;
  List<Cities>? cities;

  DataMyProfile copyWith({
    UserMyProfile? userMyProfile,
    List<Countries>? countries,
    List<Cities>? cities,
  }) =>
      DataMyProfile(
        userMyProfile: userMyProfile ?? this.userMyProfile,
        countries: countries ?? this.countries,
        cities: cities ?? this.cities,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userMyProfile != null) {
      map['user'] = userMyProfile?.toJson();
    }
    if (countries != null) {
      map['countries'] = countries?.map((v) => v.toJson()).toList();
    }
    if (cities != null) {
      map['cities'] = cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Cities citiesFromJson(String str) => Cities.fromJson(json.decode(str));

String citiesToJson(Cities data) => json.encode(data.toJson());

class Cities {
  Cities({
    this.id,
    this.countryId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Cities.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  num? countryId;
  String? name;
  String? createdAt;
  String? updatedAt;

  Cities copyWith({
    num? id,
    num? countryId,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) =>
      Cities(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_id'] = countryId;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));

String countriesToJson(Countries data) => json.encode(data.toJson());

class Countries {
  Countries({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Countries.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Countries copyWith({
    num? id,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) =>
      Countries(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

UserMyProfile userMyProfileFromJson(String str) =>
    UserMyProfile.fromJson(json.decode(str));

String userMyProfileToJson(UserMyProfile data) => json.encode(data.toJson());

class UserMyProfile {
  UserMyProfile({
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
    this.country,
    this.city,
  });

  UserMyProfile.fromJson(dynamic json) {
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
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
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
  Country? country;
  City? city;

  UserMyProfile copyWith({
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
    Country? country,
    City? city,
  }) =>
      UserMyProfile(
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
        country: country ?? this.country,
        city: city ?? this.city,
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
    if (country != null) {
      map['country'] = country?.toJson();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }
}

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    this.id,
    this.countryId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  num? countryId;
  String? name;
  String? createdAt;
  String? updatedAt;

  City copyWith({
    num? id,
    num? countryId,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) =>
      City(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_id'] = countryId;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Country.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Country copyWith({
    num? id,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) =>
      Country(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
