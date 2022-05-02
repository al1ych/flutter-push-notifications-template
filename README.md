# руководство по подключению пушей

1. создаем файрбейз проект

2. создаем андроид приложение

3. ставим пакет из андроид/апп/билд.грейдл и название любое, клик Регистер апп

4. качаем конфиг google_services.json и ставим в проект в апп/

5. нам предлагают копировать эти штуки и говорят куда их ставить : первый скрипт в грейдл на уровне проекта, второй скрипт в грейдл на уровне апп
   в первом скрипте: проверяем что google стоит в двух местах, в депененсис добавляем указанную строчку:
   classpath 'com.google.gms:google-services:4.3.10'
   во втором скрипте: там где применяются apply добавляем эту строчку: apply plugin: 'com.google.gms.google-services'
   больше ничего не делаем так как дальше идут зависимости а мы их хотим добавлять на уровне флаттера в pubspec.yaml

6. pubspec:
   firebase_core: ^1.15.0
   firebase_messaging: ^11.2.15
> flutter pub get

7. пробуем запустить если есть проблема с версией меняем min sdk (искать в Заметках Программиста по тегу #f)
   варнинги как на картинке это норма

8. мейн изменить на такой:
   void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
   }

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
