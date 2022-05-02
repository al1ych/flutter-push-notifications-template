import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Push Test',
      home: Scaffold(
        body: MessageHandler(),
      ),
    );
  }
}

class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  // final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  late StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();

    _initPush();
  }

  @override
  Widget build(BuildContext context) {
    // _handleMessages(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('FCM Push Notifications'),
      ),
    );
  }

  void _initPush() async {
    _fcm.requestPermission();

    String? fcmToken = await _fcm.getToken();
    print("==== FCM TOKEN ====");
    print(fcmToken);
    print("===================");

    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      print("new message: ${msg.data}");
      if (msg.notification != null) {
        print("also notification!");
      }
    });
  }
}
