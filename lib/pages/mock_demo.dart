import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';

class MockDemo extends StatelessWidget {
  const MockDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<AuthCubits>().logOut();
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ),
    );
  }
}
