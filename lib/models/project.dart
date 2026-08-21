import 'package:uuid/uuid.dart';

class Project {
  final String id;
  String name;
  String description;
  String technologies;
  String link;
  String startDate;
  String endDate;

  Project({
    String? id,
    this.name = '',
    this.description = '',
    this.technologies = '',
    this.link = '',
    this.startDate = '',
    this.endDate = '',
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'technologies': technologies,
        'link': link,
        'startDate': startDate,
        'endDate': endDate,
      };

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json['id'],
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        technologies: json['technologies'] ?? '',
        link: json['link'] ?? '',
        startDate: json['startDate'] ?? '',
        endDate: json['endDate'] ?? '',
      );

  Project copyWith({
    String? name,
    String? description,
    String? technologies,
    String? link,
    String? startDate,
    String? endDate,
  }) {
    return Project(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
      link: link ?? this.link,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
