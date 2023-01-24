import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  Client({
    this.id,
    this.type,
    this.membership,
    this.name,
    this.gender,
    this.id_number,
    this.id_end,
    this.phone,
    this.phone_verify_at,
    this.email,
    this.email_verified_at,
    this.photo,
    this.city_name,
    this.city_id,
    this.country_id,
    this.occupation_id,
    this.qualification_id,
    this.specialty_id,
    this.birthdate,
    this.address,
    this.company_name,
    this.company_number,
    this.contract,
    this.is_active,
    this.notes,
    this.current_balance,
    this.suspended_balance,
    this.years_of_experience,
    this.bank_account,
    this.bio,
    this.created_at,
    this.updated_at,
    this.last_seen,
    this.is_block,
    this.consulting_request_id,
    this.VendorConsultingTotalEvaluate,
    this.LatestConsultingRequests,
  });

  Client.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    membership = json['membership'];
    name = json['name'];
    gender = json['gender'];
    id_number = json['id_number'];
    id_end = json['id_end'];
    phone = json['phone'];
    phone_verify_at = json['phone_verify_at'];
    email = json['email'];
    email_verified_at = json['email_verified_at'];
    photo = json['photo'];
    city_name = json['city_name'];
    city_id = json['city_id'];
    country_id = json['country_id'];
    occupation_id = json['occupation_id'];
    qualification_id = json['qualification_id'];
    specialty_id = json['specialty_id'];
    birthdate = json['birthdate'];
    address = json['address'];
    company_name = json['company_name'];
    company_number = json['company_number'];
    contract = json['contract'];
    is_active = json['is_active'];
    notes = json['notes'];
    current_balance = json['current_balance'];
    suspended_balance = json['suspended_balance'];
    years_of_experience = json['years_of_experience'];
    bank_account = json['bank_account'];
    bio = json['bio'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    last_seen = json['last_seen'];
    is_block = json['is_block'];
    consulting_request_id = json['consulting_request_id'];
    VendorConsultingTotalEvaluate = json['VendorConsultingTotalEvaluate'];
    LatestConsultingRequests = json['LatestConsultingRequests'];

  }

  num? id;
  String? type;
  String? membership;
  String? name;
  String? gender;
  String? id_number;
  String? id_end;
  String? phone;
  String? phone_verify_at;
  String? email;
  String? email_verified_at;
  String? photo;
  String? city_name;
  num? city_id;
  num? country_id;
  num? occupation_id;
  num? qualification_id;
  num? specialty_id;
  String? birthdate;
  String? address;
  String? company_name;
  String? company_number;
  String? contract;
  num? is_active;
  String? notes;
  double? current_balance;
  double? suspended_balance;
  num? years_of_experience;
  String? bank_account;
  String? bio;
  String? created_at;
  String? updated_at;
  String? last_seen;
  num? is_block;
  num? consulting_request_id;
  num? VendorConsultingTotalEvaluate;
  String? LatestConsultingRequests;

  Client copyWith({
    num? id,
    String? type,
    String? membership,
    String? name,
    String? gender,
    String? id_number,
    String? id_end,
    String? phone,
    String? phone_verify_at,
    String? email,
    String? email_verified_at,
    String? photo,
    String? city_name,
    num? city_id,
    num? country_id,
    num? occupation_id,
    num? qualification_id,
    num? specialty_id,
    String? birthdate,
    String? address,
    String? company_name,
    String? company_number,
    String? contract,
    num? is_active,
    String? notes,
    double? current_balance,
    double? suspended_balance,
    num? years_of_experience,
    String? bank_account,
    String? bio,
    String? created_at,
    String? updated_at,
    String? last_seen,
    num? is_block,
    num? consulting_request_id,
    num? VendorConsultingTotalEvaluate,
    String? LatestConsultingRequests,
  }) =>
      Client(
        id: id ?? this.id,
        type: type ?? this.type,
        membership: membership ?? this.membership,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        id_number: id_number ?? this.id_number,
        id_end: id_end ?? this.id_end,
        phone: phone ?? this.phone,
        phone_verify_at: phone_verify_at ?? this.phone_verify_at,
        email: email ?? this.email,
        email_verified_at: email_verified_at ?? this.email_verified_at,
        photo: photo ?? this.photo,
        city_name: city_name ?? this.city_name,
        city_id: city_id ?? this.city_id,
        country_id: country_id ?? this.country_id,
        occupation_id: occupation_id ?? this.occupation_id,
        qualification_id: qualification_id ?? this.qualification_id,
        specialty_id: specialty_id ?? this.specialty_id,
        birthdate: birthdate ?? this.birthdate,
        address: address ?? this.address,
        company_name: company_name ?? this.company_name,
        company_number: company_number ?? this.company_number,
        contract: contract ?? this.contract,
        is_active: is_active ?? this.is_active,
        notes: notes ?? this.notes,
        current_balance: current_balance ?? this.current_balance,
        suspended_balance: suspended_balance ?? this.suspended_balance,
        years_of_experience: years_of_experience ?? this.years_of_experience,
        bank_account: bank_account ?? this.bank_account,
        bio: bio ?? this.bio,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
        last_seen: last_seen ?? this.last_seen,
        is_block: is_block ?? this.is_block,
        consulting_request_id: consulting_request_id ?? this.consulting_request_id,
        VendorConsultingTotalEvaluate: VendorConsultingTotalEvaluate ?? this.VendorConsultingTotalEvaluate,
        LatestConsultingRequests: LatestConsultingRequests ?? this.LatestConsultingRequests,

      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['membership'] = membership;
    map['name'] = name;
    map['gender'] = gender;
    map['id_number'] = id_number;
    map['id_end'] = id_end;
    map['phone'] = phone;
    map['phone_verify_at'] = phone_verify_at;
    map['email'] = email;
    map['email_verified_at'] = email_verified_at;
    map['photo'] = photo;
    map['city_name'] = city_name;
    map['city_id'] = city_id;
    map['country_id'] = country_id;
    map['occupation_id'] = occupation_id;
    map['qualification_id'] = qualification_id;
    map['specialty_id'] = specialty_id;
    map['birthdate'] = birthdate;
    map['address'] = address;
    map['company_name'] = company_name;
    map['company_number'] = company_number;
    map['contract'] = contract;
    map['is_active'] = is_active;
    map['notes'] = notes;
    map['current_balance'] = current_balance;
    map['suspended_balance'] = suspended_balance;
    map['years_of_experience'] = years_of_experience;
    map['bank_account'] = bank_account;
    map['bio'] = bio;
    map['created_at'] = created_at;
    map['updated_at'] = updated_at;
    map['last_seen'] = last_seen;
    map['is_block'] = is_block;
    map['consulting_request_id'] = consulting_request_id;
    map['VendorConsultingTotalEvaluate'] = VendorConsultingTotalEvaluate;
    map['LatestConsultingRequests'] = LatestConsultingRequests;

    return map;
  }
}