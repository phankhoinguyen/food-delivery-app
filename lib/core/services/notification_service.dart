import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:food_delivery/core/injection/injection.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_event.dart';
import 'package:injectable/injectable.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Background message: ${message.notification?.title}");
}

@lazySingleton
class NotificationService {
  const NotificationService(this._firebaseMessaging);
  final FirebaseMessaging _firebaseMessaging;

  Future<void> initializeNotification() async {
    final notificationBloc = getIt<NotificationBloc>();
    await _firebaseMessaging.requestPermission(provisional: true);

    FirebaseMessaging.onMessage.listen((message) {
      print('check noti');
      print(message.data);
      notificationBloc.add(const UpdateNotificationBadge());
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("Notification được tap: ${message.notification?.title}");
    });
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
}
