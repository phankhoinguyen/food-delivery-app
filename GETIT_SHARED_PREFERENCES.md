# GetIt SharedPreferences Integration

This document shows how SharedPreferences is now initialized using GetIt dependency injection in the Food Delivery app.

## Setup

### 1. Dependency Injection Configuration
File: `lib/core/injection/injection.dart`

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  await getIt.init();
}

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  
  @injectable
  http.Client get httpClient => http.Client();
}
```

### 2. Main App Initialization
File: `lib/main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase and other services
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  
  // Initialize GetIt dependency injection with SharedPreferences
  await configureDependencies();
  
  runApp(MyApp());
}
```

## Usage Examples

### 1. In Repositories with Injectable

**PaymentRepoImpl** - Uses SharedPreferences through dependency injection:

```dart
@LazySingleton(as: PaymentRepo)
class PaymentRepoImpl implements PaymentRepo {
  final SharedPreferences _prefs;
  final PaymentService _paymentService;

  PaymentRepoImpl(this._prefs, this._paymentService);

  @override
  Future<void> saveSelectedPaymentMethod(PaymentType type) async {
    await _prefs.setInt('selected_payment_method', type.index);
  }

  @override
  Future<PaymentType> getSelectedPaymentMethod() async {
    final index = _prefs.getInt('selected_payment_method');
    return index != null ? PaymentType.values[index] : PaymentType.momo;
  }
}
```

**AuthRepo** - Can also use SharedPreferences for caching:

```dart
@LazySingleton(as: AuthRepo)
class FirebaseAuthRepo implements AuthRepo {
  final SharedPreferences _prefs;

  FirebaseAuthRepo(this._prefs);

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    // ... authentication logic ...
    
    // Cache last login email using SharedPreferences
    await _prefs.setString('last_login_email', email);
    
    return user;
  }
}
```

### 2. Using GetIt in BLoCs and Pages

**Payment Page** - Gets repository from GetIt:

```dart
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(paymentRepo: getIt<PaymentRepo>()),
      child: PaymentPageContent(),
    );
  }
}
```

**Main App** - Provides repositories through GetIt:

```dart
MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => AuthCubits(authRepo: getIt<AuthRepo>()),
    ),
    BlocProvider(
      create: (context) => AddAddressBloc(
        addressRepository: getIt<AddressRepo>(),
      ),
    ),
  ],
  child: const MyApp(),
)
```

## Benefits

1. **Single Instance**: SharedPreferences is initialized once and reused throughout the app
2. **No Async Calls**: No need to call `SharedPreferences.getInstance()` repeatedly  
3. **Dependency Injection**: Clean architecture with injectable dependencies
4. **Testability**: Easy to mock SharedPreferences in tests
5. **Performance**: Faster access since instance is pre-initialized

## Key Features

- ✅ SharedPreferences initialized at app startup
- ✅ Available through GetIt dependency injection
- ✅ Used in PaymentRepo for storing payment method preferences
- ✅ Used in AuthRepo for caching login data
- ✅ HTTP client also provided through dependency injection
- ✅ Clean architecture with @injectable annotations

The SharedPreferences instance is now managed by GetIt and automatically injected into repositories that need it, eliminating the need for manual instance creation and improving app performance.
