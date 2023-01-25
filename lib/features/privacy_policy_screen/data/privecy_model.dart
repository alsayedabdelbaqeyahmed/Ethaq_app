class PrivecyPolicyModel {
  bool? status;
  String? message;
  String? data;

  PrivecyPolicyModel({
    this.status,
    this.message,
    this.data,
  });

  factory PrivecyPolicyModel.fromJson(dynamic json) {
    return PrivecyPolicyModel(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
