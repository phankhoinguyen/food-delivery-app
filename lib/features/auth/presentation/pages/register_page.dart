import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_state.dart';
import 'package:food_delivery/theme/my_color.dart';
import 'package:food_delivery/widgets/TextField/my_pass_field.dart';
import 'package:food_delivery/widgets/TextField/my_text_field.dart';
import 'package:food_delivery/widgets/my_buton.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.tooglePages});
  final void Function() tooglePages;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  final retypePasswordInput = TextEditingController();
  final usernameInput = TextEditingController();
  String? errorText;
  void signUp() {
    // Check empty fields
    if (usernameInput.text.trim().isEmpty ||
        emailInput.text.isEmpty ||
        passwordInput.text.isEmpty ||
        retypePasswordInput.text.isEmpty) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Missing information'),
              content: const Text('Please fill in all fields'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
      );
      return;
    }
    // check retype password
    if (passwordInput.text != retypePasswordInput.text) {
      setState(() {
        errorText = 'Passwords do not match';
      });
    } else {
      context.read<AuthCubits>().signUp(
        emailInput.text,
        passwordInput.text,
        usernameInput.text,
      );
      setState(() {
        errorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      'Sign Up',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MyColor.headerTextColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Please sign up to get started',
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
                          'NAME',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: MyColor.labelText),
                        ),
                        const SizedBox(height: 5),
                        MyTextField(
                          hintText: 'Leo Phan',
                          controller: usernameInput,
                        ),
                        const SizedBox(height: 24),
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
                        const SizedBox(height: 24),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'RE-TYPE PASSWORD',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: MyColor.labelText),
                              ),
                              if (errorText != null)
                                TextSpan(
                                  text: '  • ${errorText!}',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                  ),
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 5),
                        MyPassField(controller: retypePasswordInput),
                        const SizedBox(height: 45),

                        BlocBuilder<AuthCubits, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;
                            return isLoading
                                ? const MyButon.loading()
                                : MyButon(text: 'SIGN UP', onTap: signUp);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 16,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  onPressed: widget.tooglePages,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
