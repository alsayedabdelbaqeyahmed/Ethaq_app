import 'dart:convert';

import 'client_data.dart';
import 'department_data.dart';

ConsultingModel ConsultingModelFromJson(String str) =>
    ConsultingModel.fromJson(json.decode(str));

String ConsultingModelToJson(ConsultingModel data) => json.encode(data.toJson());

class ConsultingModel {
  ConsultingModel({
    this.status,
    this.message,
    this.data,
  });

  ConsultingModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataConsultingModel.fromJson(json['data']) : null;
  }

  bool? status;
  String? message;
  DataConsultingModel? data;

  ConsultingModel copyWith({
    bool? status,
    String? message,
    DataConsultingModel? data,
  }) =>
      ConsultingModel(
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

DataConsultingModel dataFromJson(String str) => DataConsultingModel.fromJson(json.decode(str));

String dataToJson(DataConsultingModel data) => json.encode(data.toJson());

class DataConsultingModel {
  DataConsultingModel({
    this.consulting,
    this.pending_count,
    this.active_count,
    this.done_count,
    this.cancel_count,
  });

  DataConsultingModel.fromJson(dynamic json) {
    consulting = json['consulting'];
    pending_count = json['pending_count'];
    active_count = json['active_count'];
    done_count = json['done_count'];
    cancel_count = json['cancel_count'];
  }

  Consulting? consulting;
  num? pending_count;
  num? active_count;
  num? done_count;
  num? cancel_count;

  DataConsultingModel copyWith({
    Consulting? consulting,
    num? pending_count,
    num? active_count,
    num? done_count,
    num? cancel_count,
  }) =>
      DataConsultingModel(
        consulting: consulting ?? this.consulting,
        pending_count: pending_count ?? this.pending_count,
        active_count: active_count ?? this.active_count,
        done_count: done_count ?? this.done_count,
        cancel_count: cancel_count ?? this.cancel_count,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (consulting != null) {
      map['consulting'] = consulting?.toJson();
    }
    map['pending_count'] = pending_count;
    map['active_count'] = active_count;
    map['done_count'] = done_count;
    map['cancel_count'] = cancel_count;
    return map;
  }
}

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
    this.client,
    this.department,
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
    client = json['client'];
    department = json['department'];
    }

  num? id;
  num? client_id;
  num? vendor_id;
  num? department_id;
  String? other_department;
  num? offer_id;
  String? details;
  String? status;
  String? amount;
  num? min;
  num? sec;
  String? created_at;
  String? updated_at;
  num? free;
  num? evaluate_count;
  Client? client;
  Department? department;

  Consulting copyWith({
    num? id,
    num? client_id,
    num? vendor_id,
    num? department_id,
    String? other_department,
    num? offer_id,
    String? details,
    String? status,
    String? amount,
    num? min,
    num? sec,
    String? created_at,
    String? updated_at,
    num? free,
    num? evaluate_count,
    Client? client,
    Department? department,
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
        client: client ?? this.client,
        department: department ?? this.department,
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
    map['client'] = client;
    map['department'] = department;
    return map;
  }
}

