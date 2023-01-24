import 'dart:convert';

SendLoginSmsModel sendLoginSmsModelFromJson(String str) =>
    SendLoginSmsModel.fromJson(json.decode(str));

String sendLoginSmsModelToJson(SendLoginSmsModel data) =>
    json.encode(data.toJson());

class SendLoginSmsModel {
  SendLoginSmsModel({
    this.status,
    this.message,
    this.data,
    this.errors,
  });

  SendLoginSmsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataLoginSms.fromJson(json['data']) : null;
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  bool? status;
  String? message;
  DataLoginSms? data;
  Errors? errors;

  SendLoginSmsModel copyWith({
    bool? status,
    String? message,
    DataLoginSms? data,
    Errors? errors,
  }) =>
      SendLoginSmsModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        errors: errors ?? this.errors,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }
}

Errors errorsFromJson(String str) => Errors.fromJson(json.decode(str));

String errorsToJson(Errors data) => json.encode(data.toJson());

class Errors {
  Errors({
    this.mobile,
  });

  Errors.fromJson(dynamic json) {
    mobile = json['mobile'] != null ? json['mobile'].cast<String>() : [];
  }

  List<String>? mobile;

  Errors copyWith({
    List<String>? mobile,
  }) =>
      Errors(
        mobile: mobile ?? this.mobile,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = mobile;
    return map;
  }
}

DataLoginSms dataFromJson(String str) => DataLoginSms.fromJson(json.decode(str));

String dataToJson(DataLoginSms data) => json.encode(data.toJson());

class DataLoginSms {
  DataLoginSms({
    this.otp,
  });

  DataLoginSms.fromJson(dynamic json) {
    otp = json['otp'];
  }

  String? otp;

  DataLoginSms copyWith({
    String? otp,
  }) =>
      DataLoginSms(
        otp: otp ?? this.otp,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = otp;
    return map;
  }
}
