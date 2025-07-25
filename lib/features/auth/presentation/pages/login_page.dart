import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_state.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/core/widgets/TextField/my_pass_field.dart';
import 'package:food_delivery/core/widgets/TextField/my_text_field.dart';
import 'package:food_delivery/core/widgets/my_buton.dart';
import 'package:food_delivery/core/widgets/my_check_box.dart';

class LoginPage extends StatelessWidget {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  final void Function() tooglePages;
  LoginPage({super.key, required this.tooglePages});

  @override
  Widget build(BuildContext context) {
    void logIn() {
      context.read<AuthCubits>().signIn(emailInput.text, passwordInput.text);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: MyColor.darkBackground,
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/login_background.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Log In',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MyColor.headerTextColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Please sign in to your existing account',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyColor.headerTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 375,
                height: MediaQuery.of(context).size.height * .75,
                decoration: const BoxDecoration(
                  color: MyColor.lightBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EMAIL',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: MyColor.labelText),
                        ),
                        const SizedBox(height: 5),
                        MyTextField(
                          hintText: 'example@gmail.com',
                          controller: emailInput,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'PASSWORD',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: MyColor.labelText),
                        ),
                        const SizedBox(height: 5),
                        MyPassField(controller: passwordInput),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                const MyCheckBox(),
                                Text(
                                  'Remember me',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: const Color(0xFF7E8A97)),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password',
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: MyColor.primary),
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<AuthCubits, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;
                            return isLoading
                                ? const MyButon.loading()
                                : MyButon(text: 'LOG IN', onTap: logIn);
                          },
                        ),
                        const SizedBox(height: 38),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Don’t have an account?',
                              style: TextStyle(
                                color: Color(0xFF646982),
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              onTap: tooglePages,
                              child: Text(
                                'SIGN UP',
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: MyColor.primary),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 27),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: Color(0xFF646982),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 31,
                                backgroundColor: Color(0xFF395998),
                                child: FaIcon(
                                  FontAwesomeIcons.facebookF,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            const SizedBox(width: 28),
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 31,
                                backgroundColor: Colors.white,
                                child: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Image.asset(
                                    'assets/google.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 28),
                            InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 31,
                                backgroundColor: Colors.black,
                                child: FaIcon(
                                  FontAwesomeIcons.apple,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
