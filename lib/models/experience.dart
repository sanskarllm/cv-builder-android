import 'package:uuid/uuid.dart';

class Experience {
  final String id;
  String company;
  String position;
  String location;
  String startDate;
  String endDate;
  String description;
  bool isCurrent;
  List<String> highlights;

  Experience({
    String? id,
    this.company = '',
    this.position = '',
    this.location = '',
    this.startDate = '',
    this.endDate = '',
    this.description = '',
    this.isCurrent = false,
    List<String>? highlights,
  })  : id = id ?? const Uuid().v4(),
        highlights = highlights ?? [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'company': company,
        'position': position,
        'location': location,
        'startDate': startDate,
        'endDate': endDate,
        'description': description,
        'isCurrent': isCurrent,
        'highlights': highlights,
      };

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json['id'],
        company: json['company'] ?? '',
        position: json['position'] ?? '',
        location: json['location'] ?? '',
        startDate: json['startDate'] ?? '',
        endDate: json['endDate'] ?? '',
        description: json['description'] ?? '',
        isCurrent: json['isCurrent'] ?? false,
        highlights: (json['highlights'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
      );

  Experience copyWith({
    String? company,
    String? position,
    String? location,
    String? startDate,
    String? endDate,
    String? description,
    bool? isCurrent,
    List<String>? highlights,
  }) {
    return Experience(
      id: id,
      company: company ?? this.company,
      position: position ?? this.position,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      isCurrent: isCurrent ?? this.isCurrent,
      highlights: highlights ?? this.highlights,
    );
  }
}
