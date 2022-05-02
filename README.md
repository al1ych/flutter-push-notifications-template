# руководство по подключению пушей

## 1. создаем файрбейз проект
![IMAGE 2022-05-02 15:43:15](https://user-images.githubusercontent.com/19241702/166235441-475057d5-9192-47c9-80f6-16e7859de477.jpg)

## 2. создаем андроид приложение
![telegram-cloud-photo-size-2-5440518336535444014-y](https://user-images.githubusercontent.com/19241702/166235465-5c8b7928-2de7-4f12-aef4-e22b8fb4369a.jpg)

## 3. ставим пакет из андроид/апп/билд.грейдл и название любое, клик Регистер апп
![telegram-cloud-photo-size-2-5440518336535444015-y](https://user-images.githubusercontent.com/19241702/166235505-33280723-0840-42c2-8735-e94c9ed746b4.jpg)

## 4. качаем конфиг google_services.json и ставим в проект в апп/
![telegram-cloud-photo-size-2-5440518336535444016-y](https://user-images.githubusercontent.com/19241702/166235531-80b5e0e6-9f3a-43d1-8a40-998a545f366f.jpg)

## 5. нам предлагают копировать эти штуки и говорят куда их ставить
![telegram-cloud-photo-size-2-5440518336535444017-y](https://user-images.githubusercontent.com/19241702/166235570-df1b7ccc-1659-4f49-abb7-f4faaca3f4f0.jpg)

первый скрипт в грейдл на уровне проекта, второй скрипт в грейдл на уровне апп

в первом скрипте: проверяем что google стоит в двух местах, в депененсис добавляем указанную строчку: > classpath 'com.google.gms:google-services:4.3.10'
во втором скрипте: там где применяются apply добавляем эту строчку: > apply plugin: 'com.google.gms.google-services'
больше ничего не делаем так как дальше идут зависимости а мы их хотим добавлять на уровне флаттера в pubspec.yaml
   

## 6. pubspec:
   firebase_core: ^1.15.0
   firebase_messaging: ^11.2.15
> flutter pub get

## 7. пробуем запустить если есть проблема с версией меняем min sdk (искать в Заметках Программиста по тегу #f)
   варнинги как на картинке это норма

## 8. мейн изменить на такой:
   > void main() async {
      > WidgetsFlutterBinding.ensureInitialized();
      > await Firebase.initializeApp();
      > runApp(MyApp());
   > }
   
