import 'package:uuid/uuid.dart';

class Skill {
  final String id;
  String name;
  int level; // 1-5

  Skill({
    String? id,
    this.name = '',
    this.level = 3,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'level': level,
      };

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json['id'],
        name: json['name'] ?? '',
        level: json['level'] ?? 3,
      );

  Skill copyWith({
    String? name,
    int? level,
  }) {
    return Skill(
      id: id,
      name: name ?? this.name,
      level: level ?? this.level,
    );
  }
}
