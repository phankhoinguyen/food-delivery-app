import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/notification/domain/repo/notification_repo.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_event.dart';
import 'package:food_delivery/features/notification/presentation/bloc/notification_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepo repo;
  NotificationBloc(this.repo)
    : super(const NotificationState(isLoading: true)) {
    on<GetNotifications>(_onGetNotifications);
    on<GetUnreadNotificationsCount>(_onGetUnreadNotificationsCount);
    on<UpdateNotificationBadge>(_onUpdateNotificationBadge);
    on<MarkReadAll>(_onMarkReadAll);
  }

  Future<void> _onGetNotifications(
    GetNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final list = await repo.getNotifications();
      emit(state.copyWith(listNoti: list));
      add(const MarkReadAll());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _onGetUnreadNotificationsCount(
    GetUnreadNotificationsCount event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      final unreadQuantity = await repo.getUnreadNoifications();
      if (unreadQuantity > 0) {
        emit(state.copyWith(unreadQuantity: unreadQuantity));
      }
      print(state.unreadQuantity);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _onMarkReadAll(
    MarkReadAll event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      repo.markReadAll();
      emit(state.copyWith(isLoading: false, unreadQuantity: null));
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _onUpdateNotificationBadge(
    UpdateNotificationBadge event,
    Emitter<NotificationState> emit,
  ) {
    try {
      final currentUnreadQuantity = state.unreadQuantity;
      if (currentUnreadQuantity == null) {
        emit(state.copyWith(unreadQuantity: 1));
      } else {
        emit(state.copyWith(unreadQuantity: currentUnreadQuantity + 1));
      }
    } catch (e) {
      rethrow;
    }
  }
}
