import 'dart:convert';

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));

String offerToJson(Offer data) => json.encode(data.toJson());

class Offer {
  Offer({
    this.id,
    this.vendor_id,
    this.consulting_id,
    this.amount,
    this.status,
    this.created_at,
    this.updated_at,
  });

  Offer.fromJson(dynamic json) {
    id = json['id'];
    vendor_id = json['vendor_id'];
    consulting_id = json['consulting_id'];
    amount = json['amount'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  num? id;
  num? vendor_id;
  num? consulting_id;
  num? amount;
  String? status;
  String? created_at;
  String? updated_at;

  Offer copyWith({
    num? id,
    num? vendor_id,
    num? consulting_id,
    num? amount,
    String? status,
    String? created_at,
    String? updated_at,
  }) =>
      Offer(
        id: id ?? this.id,
        vendor_id: vendor_id ?? this.vendor_id,
        consulting_id: consulting_id ?? this.consulting_id,
        amount: amount ?? this.amount,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendor_id;
    map['consulting_id'] = consulting_id;
    map['amount'] = amount;
    map['created_at'] = created_at;
    map['updated_at'] = updated_at;

    return map;
  }
}