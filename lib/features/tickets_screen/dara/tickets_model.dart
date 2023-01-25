class TicketModel {
  final num? id;
  final String? title;
  final String? type;
  final String? description;
  final int? userId;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TicketModel({
    this.id,
    this.title,
    this.type,
    this.description,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TicketModel.fromJson(dynamic json) {
    return TicketModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      description: json['description'],
      userId: json['user_id'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
