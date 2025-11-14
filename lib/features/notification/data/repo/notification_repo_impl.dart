import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/core/constants/api_constants.dart';
import 'package:food_delivery/core/constants/types.dart';
import 'package:food_delivery/core/injection/injection.dart';
import 'package:food_delivery/features/notification/domain/entities/notification_entity.dart';
import 'package:food_delivery/features/notification/domain/repo/notification_repo.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationRepo)
class NotificationRepoImpl implements NotificationRepo {
  @override
  Future<List<NotificationEntity>> getNotifications() async {
    final auth = getIt<FirebaseAuth>();
    final token = await auth.currentUser!.getIdToken();
    final headers = ApiConstants.authHeaders(token ?? '');
    try {
      final res = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/notifications'),
        headers: headers,
      );
      final resData = jsonDecode(res.body) as JsonMap;
      final listData = List<JsonMap>.from(resData['data']);
      print(listData);
      final listNoti =
          listData.map((item) => NotificationEntity.fromJson(item)).toList();
      return listNoti;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> getUnreadNoifications() async {
    final auth = getIt<FirebaseAuth>();
    final token = await auth.currentUser!.getIdToken();
    final headers = ApiConstants.authHeaders(token ?? '');
    try {
      final res = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/notifications/unread/count'),
        headers: headers,
      );
      final resData = jsonDecode(res.body) as JsonMap;

      return resData['count'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markReadAll() async {
    final auth = getIt<FirebaseAuth>();
    final token = await auth.currentUser!.getIdToken();
    final headers = ApiConstants.authHeaders(token ?? '');
    try {
      await http.put(
        Uri.parse('${ApiConstants.baseUrl}/api/notifications/read/all'),
        headers: headers,
      );
    } catch (e) {
      rethrow;
    }
  }
}
