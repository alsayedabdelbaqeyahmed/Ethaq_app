// ignore_for_file: avoid_multiple_declarations_per_line

class SupportModel {
  final String? name, phone, email, subject, message, updatedAt, createdAt;
  final num? id;

  SupportModel({
    this.name,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.email,
    this.subject,
    this.message,
  });

  factory SupportModel.fromJson(dynamic map) {
    return SupportModel(
      name: map['name'],
      id: map['id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      phone: map['phone'],
      email: map['email'],
      subject: map['subject'],
      message: map['message'],
    );
  }
}
