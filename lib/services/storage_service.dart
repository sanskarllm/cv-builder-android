import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/resume.dart';

class StorageService {
  static const String _key = 'resumes';

  Future<List<Resume>> loadResumes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];
    try {
      final List<dynamic> list = jsonDecode(jsonString);
      return list.map((e) => Resume.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> saveResumes(List<Resume> resumes) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(resumes.map((r) => r.toJson()).toList());
    await prefs.setString(_key, jsonString);
  }

  Future<void> saveResume(Resume resume) async {
    final resumes = await loadResumes();
    final index = resumes.indexWhere((r) => r.id == resume.id);
    if (index >= 0) {
      resumes[index] = resume;
    } else {
      resumes.add(resume);
    }
    await saveResumes(resumes);
  }

  Future<void> deleteResume(String id) async {
    final resumes = await loadResumes();
    resumes.removeWhere((r) => r.id == id);
    await saveResumes(resumes);
  }
}
