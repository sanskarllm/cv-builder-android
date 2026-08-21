import 'package:uuid/uuid.dart';
import 'personal_info.dart';
import 'education.dart';
import 'experience.dart';
import 'skill.dart';
import 'project.dart';

class Resume {
  final String id;
  String title;
  PersonalInfo personalInfo;
  String summary;
  List<Education> education;
  List<Experience> experience;
  List<Skill> skills;
  List<Project> projects;
  String templateId; // 'classic', 'modern', 'minimal'
  DateTime createdAt;
  DateTime updatedAt;

  Resume({
    String? id,
    this.title = 'Untitled Resume',
    PersonalInfo? personalInfo,
    this.summary = '',
    List<Education>? education,
    List<Experience>? experience,
    List<Skill>? skills,
    List<Project>? projects,
    this.templateId = 'modern',
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        personalInfo = personalInfo ?? PersonalInfo(),
        education = education ?? [],
        experience = experience ?? [],
        skills = skills ?? [],
        projects = projects ?? [],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'personalInfo': personalInfo.toJson(),
        'summary': summary,
        'education': education.map((e) => e.toJson()).toList(),
        'experience': experience.map((e) => e.toJson()).toList(),
        'skills': skills.map((e) => e.toJson()).toList(),
        'projects': projects.map((e) => e.toJson()).toList(),
        'templateId': templateId,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
        id: json['id'],
        title: json['title'] ?? 'Untitled Resume',
        personalInfo: PersonalInfo.fromJson(json['personalInfo'] ?? {}),
        summary: json['summary'] ?? '',
        education: (json['education'] as List<dynamic>?)
                ?.map((e) => Education.fromJson(e))
                .toList() ??
            [],
        experience: (json['experience'] as List<dynamic>?)
                ?.map((e) => Experience.fromJson(e))
                .toList() ??
            [],
        skills: (json['skills'] as List<dynamic>?)
                ?.map((e) => Skill.fromJson(e))
                .toList() ??
            [],
        projects: (json['projects'] as List<dynamic>?)
                ?.map((e) => Project.fromJson(e))
                .toList() ??
            [],
        templateId: json['templateId'] ?? 'modern',
        createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      );

  Resume copyWith({
    String? title,
    PersonalInfo? personalInfo,
    String? summary,
    List<Education>? education,
    List<Experience>? experience,
    List<Skill>? skills,
    List<Project>? projects,
    String? templateId,
  }) {
    return Resume(
      id: id,
      title: title ?? this.title,
      personalInfo: personalInfo ?? this.personalInfo,
      summary: summary ?? this.summary,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      skills: skills ?? this.skills,
      projects: projects ?? this.projects,
      templateId: templateId ?? this.templateId,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
