import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_delivery/core/injection/injection.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_event.dart';
import 'package:injectable/injectable.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Background message: ${message.notification?.title}");
}

@lazySingleton
class NotificationService {
  const NotificationService(this._firebaseMessaging, this._localNoti);
  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _localNoti;

  Future<void> initializeNotification() async {
    final notificationBloc = getIt<NotificationBloc>();
    await _firebaseMessaging.requestPermission(provisional: true);
    await initLocalNoti();

    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      final auth = getIt<FirebaseAuth>();
      final firestore = getIt<FirebaseFirestore>();
      firestore.collection('user').doc(auth.currentUser?.uid).update({
        'deviceTokens': FieldValue.arrayUnion([newToken]),
      });
    });

    FirebaseMessaging.onMessage.listen((message) {
      final title = message.notification?.title ?? 'No title';
      final body = message.notification?.body ?? 'No body';
      notificationBloc.add(const UpdateNotificationBadge());

      showLocalNotification(title: title, body: body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("Notification được tap: ${message.notification?.title}");
    });
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

  // Local Notification

  Future<void> initLocalNoti() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _localNoti.initialize(settings);
  }

  Future<void> showLocalNotification({
    int id = 0,
    required String title,
    required String body,
  }) async {
    print('local show');
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'default_channel',
          'Default Channel',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _localNoti.show(id, title, body, details);
  }
}
