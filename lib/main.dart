import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/injection/injection.dart';
import 'package:food_delivery/features/auth/domain/repo/auth_repo.dart';
import 'package:food_delivery/features/setting/address/domain/repo/add_address_repo.dart';
import 'package:food_delivery/features/setting/address/domain/repo/address_page_repo.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/add_address/add_address_bloc.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/address_page/address_page_cubits.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_delivery/config/firebase_options.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/pages/splash_screen.dart';

import 'package:food_delivery/core/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");

  // Initialize GetIt dependency injection
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AuthCubits(authRepo: getIt<AuthRepo>())..checkAuth(),
        ),
        BlocProvider(
          create:
              (context) =>
                  AddAddressBloc(addressRepository: getIt<AddressRepo>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  AddressPageCubits(addressrepo: getIt<AddressPageRepo>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SafeArea(bottom: false, top: false, child: AuthGate()),
      home: const SplashScreen(),

      theme: lightMode,
    );
  }
}
