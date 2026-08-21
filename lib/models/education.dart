import 'package:uuid/uuid.dart';

class Education {
  final String id;
  String institution;
  String degree;
  String fieldOfStudy;
  String startDate;
  String endDate;
  String description;
  bool isCurrent;

  Education({
    String? id,
    this.institution = '',
    this.degree = '',
    this.fieldOfStudy = '',
    this.startDate = '',
    this.endDate = '',
    this.description = '',
    this.isCurrent = false,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'institution': institution,
        'degree': degree,
        'fieldOfStudy': fieldOfStudy,
        'startDate': startDate,
        'endDate': endDate,
        'description': description,
        'isCurrent': isCurrent,
      };

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json['id'],
        institution: json['institution'] ?? '',
        degree: json['degree'] ?? '',
        fieldOfStudy: json['fieldOfStudy'] ?? '',
        startDate: json['startDate'] ?? '',
        endDate: json['endDate'] ?? '',
        description: json['description'] ?? '',
        isCurrent: json['isCurrent'] ?? false,
      );

  Education copyWith({
    String? institution,
    String? degree,
    String? fieldOfStudy,
    String? startDate,
    String? endDate,
    String? description,
    bool? isCurrent,
  }) {
    return Education(
      id: id,
      institution: institution ?? this.institution,
      degree: degree ?? this.degree,
      fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }
}
