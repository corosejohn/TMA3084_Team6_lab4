# Jamali Pizzaria

Flutter pizza store app for Lab Exercise 4.1 (navigation and named routing).

## Pages and files

| Page | Route | File |
| --- | --- | --- |
| Home (name, hero image, 3 `OutlinedButton`s, X and Facebook icons) | `/` | `lib/pages/home_page.dart` |
| Menu (images, names, prices) | `/menu` | `lib/pages/menu_page.dart` |
| About | `/about` | `lib/pages/about_page.dart` |
| Contact | `/contact` | `lib/pages/contact_page.dart` |
| Twitter / X (WebView) | `/twitter` | `lib/pages/twitter_page.dart` |
| Facebook (WebView) | `/facebook` | `lib/pages/facebook_page.dart` |

Shared files: `lib/main.dart` (route table), `lib/routes.dart` (route names),
`lib/data/pizzas.dart` (menu data), `lib/pages/web_view_page.dart` (WebView).

## First-time setup

```bash
flutter create . --project-name jamali_pizzaria   # adds android/, ios/, etc.
flutter pub get
dart format .
flutter analyze
flutter test
flutter run
```

After `flutter create .`, confirm `lib/main.dart` still contains
`JamaliPizzariaApp` (restore it from this project if it was replaced).

For release builds on Android, add this line inside `<manifest>` in
`android/app/src/main/AndroidManifest.xml` so the WebView pages can reach the
internet:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Group workflow

```bash
git checkout -b feature/<matric-number>
git add .
git commit -m "feat: add <page> page"
git push -u origin feature/<matric-number>
```

The group leader opens pull requests, reviews, and merges every branch into
`main`. Always run `dart format .`, `flutter analyze` and `flutter test`
before pushing, or the CI formatting check will fail.

## CI

`.github/workflows/ci.yml` runs on every push and pull request:
`dart format --set-exit-if-changed`, `flutter analyze`, `flutter test`.

## PDF report checklist

- [ ] Shared GitHub repository link at the very top
- [ ] Your name, matric number and branch name
- [ ] Screenshots of all six pages (Home, Menu, About, Contact, X, Facebook)
- [ ] Screenshots of your branch and commits/contributions on GitHub
- [ ] Screenshots of the GitHub Actions run and its results
- [ ] Short explanation of the work you completed

## Images

The pizza pictures in `assets/images/` are simple illustrations. Replace them
with your own photos using the same file names (or update `lib/data/pizzas.dart`).
