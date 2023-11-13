import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title :${message.notification!.title}");
  print("Body: ${message.notification!.body}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token $fCMToken");
    FirebaseMessaging.onBackgroundMessage(
        (message) => handleBackgroundMessage(message));
  }
}
