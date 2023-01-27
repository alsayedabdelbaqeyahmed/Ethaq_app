class LawyersModels {
  final String? name;
  final String? photo;
  final num? id;

  LawyersModels({this.name, this.photo, this.id});

  factory LawyersModels.fromJson(Map<dynamic, dynamic> json) {
    return LawyersModels(
      id: json['id'],
      photo: json['photo'],
      name: json['name'],
    );
  }
}
