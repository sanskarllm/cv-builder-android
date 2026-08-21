import 'package:flutter/foundation.dart';
import '../models/resume.dart';
import '../services/storage_service.dart';

class ResumeProvider extends ChangeNotifier {
  final StorageService _storage = StorageService();
  List<Resume> _resumes = [];
  Resume? _current;
  bool _loading = true;

  List<Resume> get resumes => _resumes;
  Resume? get current => _current;
  bool get loading => _loading;

  Future<void> load() async {
    _loading = true;
    notifyListeners();
    _resumes = await _storage.loadResumes();
    // Sort by updatedAt desc
    _resumes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    _loading = false;
    notifyListeners();
  }

  Future<void> createNew({String title = 'Untitled Resume'}) async {
    final resume = Resume(title: title);
    _resumes.insert(0, resume);
    _current = resume;
    await _storage.saveResume(resume);
    notifyListeners();
  }

  void setCurrent(Resume resume) {
    _current = resume;
    notifyListeners();
  }

  Future<void> updateCurrent(Resume updated) async {
    final index = _resumes.indexWhere((r) => r.id == updated.id);
    if (index >= 0) {
      _resumes[index] = updated;
      _current = updated;
      await _storage.saveResume(updated);
      notifyListeners();
    }
  }

  Future<void> delete(String id) async {
    _resumes.removeWhere((r) => r.id == id);
    if (_current?.id == id) _current = null;
    await _storage.deleteResume(id);
    notifyListeners();
  }

  Future<void> duplicate(Resume original) async {
    final copy = Resume(
      title: '${original.title} (Copy)',
      personalInfo: original.personalInfo,
      summary: original.summary,
      education: List.from(original.education),
      experience: List.from(original.experience),
      skills: List.from(original.skills),
      projects: List.from(original.projects),
      templateId: original.templateId,
    );
    _resumes.insert(0, copy);
    await _storage.saveResume(copy);
    notifyListeners();
  }
}
