import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/payment/data/repo/payment_repo_impl.dart';
import 'package:food_delivery/features/payment/domain/repo/payment_repo.dart';
import 'package:food_delivery/features/setting/address/data/repo/i_address_page_repo.dart';
import 'package:food_delivery/features/setting/address/domain/repo/add_address_repo.dart';
import 'package:food_delivery/features/setting/address/domain/repo/address_page_repo.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/add_address/add_address_bloc.dart';
import 'package:food_delivery/features/setting/address/presentation/bloc/address_page/address_page_cubits.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_delivery/config/firebase_options.dart';
import 'package:food_delivery/features/auth/data/firebase_auth_repo.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/setting/address/data/repo/i_add_address_repo.dart';
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
  final authRepo = FirebaseAuthRepo();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AddressRepo>(
          create: (context) => AddressRepositoryImpl(),
        ),
        RepositoryProvider<AddressPageRepo>(
          create: (context) => IAddressPageRepo(),
        ),
        RepositoryProvider<PaymentRepo>(create: (context) => PaymentRepoImpl()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubits(authRepo: authRepo)..checkAuth(),
          ),
          BlocProvider(
            create:
                (context) => AddAddressBloc(
                  addressRepository: context.read<AddressRepo>(),
                ),
          ),
          BlocProvider(
            create:
                (context) => AddressPageCubits(
                  addressrepo: context.read<AddressPageRepo>(),
                ),
          ),
        ],
        child: const MyApp(),
      ),
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
