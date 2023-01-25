import 'dart:convert';

import 'client_data.dart';
import 'department_data.dart';
import 'offer_data.dart';

Consulting consultingFromJson(String str) => Consulting.fromJson(json.decode(str));

String consultingToJson(Consulting data) => json.encode(data.toJson());

class Consulting {
  Consulting({
    this.id,
    this.client_id,
    this.vendor_id,
    this.department_id,
    this.other_department,
    this.offer_id,
    this.details,
    this.status,
    this.amount,
    this.min,
    this.sec,
    this.created_at,
    this.updated_at,
    this.free,
    this.evaluate_count,
    this.offers,
    this.client,
    this.department,
    this.vendor,
    this.files,
    this.messages,
    this.evaluate,
    this.invoices,
  });

  Consulting.fromJson(dynamic json) {
    id = json['id'];
    client_id = json['client_id'];
    vendor_id = json['vendor_id'];
    department_id = json['department_id'];
    other_department = json['other_department'];
    offer_id = json['offer_id'];
    details = json['details'];
    status = json['status'];
    amount = json['amount'];
    min = json['min'];
    sec = json['sec'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    free = json['free'];
    evaluate_count = json['evaluate_count'];
    if (json['offers'] != null) {
      offers  = List<Offer>.from(
        json['offers']?.map((p) => Offer.fromJson(p)),);
    }
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    department = json['department'] != null ? Department.fromJson(json['department']) : null;
    vendor = json['vendor'];
    files = json['files'];
    messages = json['messages'];
    evaluate = json['evaluate'];
    invoices = json['invoices'];
  }

  num? id;
  num? client_id;
  num? vendor_id;
  num? department_id;
  String? other_department;
  num? offer_id;
  String? details;
  String? status;
  num? amount;
  num? min;
  num? sec;
  String? created_at;
  String? updated_at;
  num? free;
  num? evaluate_count;
  List<dynamic>? offers;
  Client? client;
  Department? department;
  dynamic? vendor;
  List<dynamic>? files;
  List<dynamic>? messages;
  dynamic? evaluate;
  dynamic? invoices;

  Consulting copyWith({
    num? id,
    num? client_id,
    num? vendor_id,
    num? department_id,
    String? other_department,
    num? offer_id,
    String? details,
    String? status,
    num? amount,
    num? min,
    num? sec,
    String? created_at,
    String? updated_at,
    num? free,
    num? evaluate_count,
    List<dynamic>? offers,
    Client? client,
    Department? department,
    dynamic? vendor,
    List<dynamic>? files,
    List<dynamic>? messages,
    dynamic? evaluate,
    dynamic? invoices,
  }) =>
      Consulting(
        id: id ?? this.id,
        client_id: client_id ?? this.client_id,
        vendor_id: vendor_id ?? this.vendor_id,
        department_id: department_id ?? this.department_id,
        other_department: other_department ?? this.other_department,
        offer_id: offer_id ?? this.offer_id,
        details: details ?? this.details,
        status: status ?? this.status,
        amount: amount ?? this.amount,
        min: min ?? this.min,
        sec: sec ?? this.sec,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
        free: free ?? this.free,
        evaluate_count: evaluate_count ?? this.evaluate_count,
        offers: offers ?? this.offers,
        client: client ?? this.client,
        department: department ?? this.department,
        vendor: vendor ?? this.vendor,
        files: files ?? this.files,
        messages: messages ?? this.messages,
        evaluate: evaluate ?? this.evaluate,
        invoices: invoices ?? this.invoices,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['client_id'] = client_id;
    map['vendor_id'] = vendor_id;
    map['department_id'] = department_id;
    map['other_department'] = other_department;
    map['offer_id'] = offer_id;
    map['details'] = details;
    map['status'] = status;
    map['amount'] = amount;
    map['min'] = min;
    map['sec'] = sec;
    map['created_at'] = created_at;
    map['updated_at'] = updated_at;
    map['free'] = free;
    map['evaluate_count'] = evaluate_count;
    if (offers != null) {
      map['offers'] = offers?.map((v) => v.toJson()).toList();
    }
    if (client != null) {
      map['client'] = client?.toJson();
    }
    if (department != null) {
      map['department'] = department?.toJson();
    }
    map['vendor'] = vendor;
    map['files'] = files;
    map['messages'] = messages;
    map['evaluate'] = evaluate;
    map['invoices'] = invoices;
    return map;
  }
}