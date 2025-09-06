// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/firebase_auth_repo.dart' as _i420;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
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
    gh.lazySingleton<_i292.AddressPageRepo>(() => _i715.IAddressPageRepo());
    gh.lazySingleton<_i384.AddressRepo>(
      () => _i961.AddressRepositoryImpl(gh<_i519.Client>()),
    );
    gh.lazySingleton<_i170.AuthRepo>(() => _i420.FirebaseAuthRepo());
    gh.factory<_i826.PaymentService>(
      () => _i826.PaymentService(gh<_i519.Client>()),
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
