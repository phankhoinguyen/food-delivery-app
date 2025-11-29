// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/firebase_auth_repo.dart' as _i420;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/home/data/category_repo_firestore.dart' as _i457;
import '../../features/home/domain/repo/category_repo.dart' as _i516;
import '../../features/notification/data/repo/notification_repo_impl.dart'
    as _i933;
import '../../features/notification/domain/repo/notification_repo.dart'
    as _i588;
import '../../features/notification/presentation/bloc/notification_bloc.dart'
    as _i29;
import '../../features/order/data/repo/order_repo_impl.dart' as _i491;
import '../../features/order/domain/repo/order_repo.dart' as _i989;
import '../../features/payment/data/repo/payment_repo_impl.dart' as _i630;
import '../../features/payment/data/services/payment_service.dart' as _i826;
import '../../features/payment/domain/repo/payment_repo.dart' as _i50;
import '../../features/setting/address/data/repo/i_add_address_repo.dart'
    as _i961;
import '../../features/setting/address/data/repo/i_address_page_repo.dart'
    as _i715;
import '../../features/setting/address/domain/repo/add_address_repo.dart'
    as _i384;
import '../../features/setting/address/domain/repo/address_page_repo.dart'
    as _i292;
import '../services/notification_service.dart' as _i941;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i519.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i892.FirebaseMessaging>(() => registerModule.mess);
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.auth);
    gh.lazySingleton<_i163.FlutterLocalNotificationsPlugin>(
      () => registerModule.localNoti,
    );
    gh.lazySingleton<_i516.CategoryRepo>(() => _i457.CategoryRepoFirestore());
    gh.lazySingleton<_i292.AddressPageRepo>(() => _i715.IAddressPageRepo());
    gh.lazySingleton<_i384.AddressRepo>(
      () => _i961.AddressRepositoryImpl(gh<_i519.Client>()),
    );
    gh.lazySingleton<_i588.NotificationRepo>(
      () => _i933.NotificationRepoImpl(),
    );
    gh.lazySingleton<_i29.NotificationBloc>(
      () => _i29.NotificationBloc(gh<_i588.NotificationRepo>()),
    );
    gh.lazySingleton<_i170.AuthRepo>(() => _i420.FirebaseAuthRepo());
    gh.lazySingleton<_i989.OrderRepo>(() => _i491.OrderRepoImpl());
    gh.factory<_i826.PaymentService>(
      () => _i826.PaymentService(gh<_i519.Client>()),
    );
    gh.lazySingleton<_i941.NotificationService>(
      () => _i941.NotificationService(
        gh<_i892.FirebaseMessaging>(),
        gh<_i163.FlutterLocalNotificationsPlugin>(),
      ),
    );
    gh.lazySingleton<_i50.PaymentRepo>(
      () => _i630.PaymentRepoImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i826.PaymentService>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
