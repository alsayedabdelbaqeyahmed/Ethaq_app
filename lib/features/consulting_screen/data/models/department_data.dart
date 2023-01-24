import 'dart:convert';

Department departmentFromJson(String str) => Department.fromJson(json.decode(str));

String departmentToJson(Department data) => json.encode(data.toJson());

class Department {
  Department({
    this.id,
    this.name,
    this.parent,
    this.created_at,
    this.updated_at,
  });

  Department.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  num? id;
  String? name;
  String? parent;
  String? created_at;
  String? updated_at;

  Department copyWith({
    num? id,
    String? name,
    String? parent,
    String? created_at,
    String? updated_at,
  }) =>
      Department(
        id: id ?? this.id,
        name: name ?? this.name,
        parent: parent ?? this.parent,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['parent'] = parent;
    map['created_at'] = created_at;
    map['updated_at'] = updated_at;

    return map;
  }
}