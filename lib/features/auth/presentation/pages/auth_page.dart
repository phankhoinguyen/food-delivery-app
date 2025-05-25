import 'package:flutter/cupertino.dart';
import 'package:food_delivery/features/auth/presentation/pages/login_page.dart';
import 'package:food_delivery/features/auth/presentation/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLogin = true;

  void tooglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginPage(tooglePages: tooglePages)
        : RegisterPage(tooglePages: tooglePages);
  }
}
