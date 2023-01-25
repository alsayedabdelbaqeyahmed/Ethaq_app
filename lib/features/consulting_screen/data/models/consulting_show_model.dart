import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'other/consulting_data.dart';



ConsultingShowModel ConsultingShowModelFromJson(String str) =>
    ConsultingShowModel.fromJson(json.decode(str));

String ConsultingShowModelToJson(ConsultingShowModel data) => json.encode(data.toJson());

class ConsultingShowModel {
  ConsultingShowModel({
    this.status,
    this.message,
    this.data,
  });

  ConsultingShowModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataConsultingShowModel.fromJson(json['data']) : null;
  }

  bool? status;
  String? message;
  DataConsultingShowModel? data;

  ConsultingShowModel copyWith({
    bool? status,
    String? message,
    DataConsultingShowModel? data,
  }) =>
      ConsultingShowModel(
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

DataConsultingShowModel dataFromJson(String str) => DataConsultingShowModel.fromJson(json.decode(str));

String dataToJson(DataConsultingShowModel data) => json.encode(data.toJson());

class DataConsultingShowModel {
  DataConsultingShowModel({
    this.consulting,
  });

  DataConsultingShowModel.fromJson(dynamic json) {
    consulting = json['consulting'] != null ? Consulting.fromJson(json['consulting']) : null;
  }

  Consulting? consulting;

  DataConsultingShowModel copyWith({
    Consulting? consulting,
  }) =>
      DataConsultingShowModel(
        consulting: consulting ?? this.consulting,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (consulting != null) {
      map['consulting'] = consulting?.toJson();
    }
    return map;
  }
}


