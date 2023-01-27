class LawyersProfileModels {
  final String? name;
  final String? photo;
  final String? idNumber;
  final num? vendorOrdersAount;
  final num? isActive;
  final num? yearsOfExperience;
  final LatestConsultingRequests? latestConsultingRequests;
  final Specialty? specialty;
  final Qualification? qualification;

  LawyersProfileModels({
    this.name,
    this.yearsOfExperience,
    this.photo,
    this.idNumber,
    this.vendorOrdersAount,
    this.isActive,
    this.latestConsultingRequests,
    this.specialty,
    this.qualification,
  });

  factory LawyersProfileModels.fromJson(dynamic map) {
    return LawyersProfileModels(
      name: map['name'],
      photo: map['photo'],
      idNumber: map['id_number'],
      vendorOrdersAount: map["vendor_orders_count"],
      yearsOfExperience: map["years_of_experience"],
      isActive: map['is_active'],
      latestConsultingRequests:
          LatestConsultingRequests.fromJson(map["LatestConsultingRequests"]),
      specialty: Specialty.formJson(map['specialty']),
      qualification: Qualification.formJson(map['qualification']),
    );
  }
}

class LatestConsultingRequests {
  final num? amount;
  final String? status;
  final num? active;

  LatestConsultingRequests({this.amount, this.status, this.active});
  factory LatestConsultingRequests.fromJson(dynamic map) {
    return LatestConsultingRequests(
      active: map['active'],
      amount: map['amount'],
      status: map['status'],
    );
  }
}

class Specialty {
  final String? name;
  final String? type;

  Specialty({this.name, this.type});
  factory Specialty.formJson(dynamic map) {
    return Specialty(
      name: map['name'],
      type: map['type'],
    );
  }
}

class Qualification {
  final String? name;
  final String? type;

  Qualification({this.name, this.type});

  factory Qualification.formJson(dynamic map) {
    return Qualification(
      name: map['name'],
      type: map['type'],
    );
  }
}
