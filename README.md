# CVCraft – Android CV / Resume Builder

A modern, clean **Flutter** app to create professional resumes on Android (also works on iOS & Web).

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-green)

## Features

- ✅ Create & manage multiple resumes
- ✅ Sections: Personal Info, Summary, Experience, Education, Skills, Projects
- ✅ **3 beautiful templates**: Modern, Classic, Minimal
- ✅ Live preview
- ✅ **Export to PDF** (print or share)
- ✅ Local storage (SharedPreferences) – works fully offline
- ✅ Material 3 design + dark mode support
- ✅ Clean, modern UI

## Screenshots / Flow

1. **Home** → List of your resumes + Create new
2. **Editor** → Tabbed interface for each section
3. **Template picker** → Choose Modern / Classic / Minimal
4. **Preview & Export** → See result and generate PDF

## Getting Started

### Prerequisites

- Flutter SDK 3.16+ ([Install Flutter](https://docs.flutter.dev/get-started/install))
- Android Studio / VS Code
- Android emulator or physical device

### Run the app

```bash
# Clone
git clone https://github.com/sanskarllm/cv-builder-android.git
cd cv-builder-android

# Get dependencies
flutter pub get

# Run on Android
flutter run
```

### Build APK

```bash
flutter build apk --release
```

The APK will be at: `build/app/outputs/flutter-apk/app-release.apk`

## Project Structure

```
lib/
├── main.dart
├── models/           # Resume, PersonalInfo, Experience, Education, Skill, Project
├── providers/        # ResumeProvider (state management)
├── screens/          # Home, Editor, Preview
├── services/         # StorageService + PdfService (3 templates)
└── widgets/          # (shared widgets if needed)
```

## Templates

| Template | Style |
|----------|-------|
| **Modern** | Blue accent, section headers, skill chips |
| **Classic** | Traditional centered layout |
| **Minimal** | Simple & elegant typography |

## Tech Stack

- Flutter + Dart
- Provider (state)
- `pdf` + `printing` packages for PDF generation
- `shared_preferences` for local persistence
- Google Fonts (Inter)

## Future Ideas

- Photo upload on resume
- More templates
- Cloud sync / Google Drive
- ATS score checker
- Cover letter generator
- Export to DOCX

## License

MIT – feel free to use and modify.

---

Made with ❤️ for job seekers
