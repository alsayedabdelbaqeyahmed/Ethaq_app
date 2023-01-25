import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'other/consulting_data.dart';



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
    if (json['consulting'] != null) {
      consulting  = List<Consulting>.from(
          json['consulting']?.map((p) => Consulting.fromJson(p)),);
    }
    pending_count = json['pending_count'];
    active_count = json['active_count'];
    done_count = json['done_count'];
    cancel_count = json['cancel_count'];
  }

  List<dynamic>? consulting;
  num? pending_count;
  num? active_count;
  num? done_count;
  num? cancel_count;

  DataConsultingModel copyWith({
    List<dynamic>? consulting,
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
      map['consulting'] = consulting?.map((v) => v.toJson()).toList();
    }
    map['pending_count'] = pending_count;
    map['active_count'] = active_count;
    map['done_count'] = done_count;
    map['cancel_count'] = cancel_count;
    return map;
  }
}


