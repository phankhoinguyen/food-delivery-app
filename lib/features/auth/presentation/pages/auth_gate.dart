import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/data/firebase_auth_repo.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_state.dart';
import 'package:food_delivery/features/auth/presentation/pages/auth_page.dart';
import 'package:food_delivery/features/setting/profile/data/profile_repo_firestore.dart';
import 'package:food_delivery/features/setting/profile/presentation/cubits/profile_cubits.dart';
import 'package:food_delivery/pages/main_page.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});

  final authRepo = FirebaseAuthRepo();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubits, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          final user = state.user;
          final profileRepo = ProfileRepoFirestore(user);
          return BlocProvider(
            create: (context) => ProfileCubits(profileRepo)..getUserProfile(),
            child: const MainPage(),
          );
        }

        return const AuthPage();
      },
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Try again!'),
                content: Text(state.msg),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
