class CommentsModel {
  final num? commentid;
  final num? ticketId;
  final String? comment;
  final num? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? readAt;

  CommentsModel({
    this.commentid,
    this.readAt,
    this.ticketId,
    this.comment,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory CommentsModel.fromJson(dynamic json) {
    return CommentsModel(
      commentid: json['id'],
      ticketId: json['ticket_id'],
      userId: json['user_id'],
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      readAt: json['read_at'],
    );
  }
}
