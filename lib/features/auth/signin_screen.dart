import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutter/features/auth/auth_controller.dart';
import 'package:reddit_flutter/features/auth/signup_screen.dart';
import 'package:reddit_flutter/theme/palette.dart';
import 'package:reddit_flutter/widget/google_sign_in_button.dart';
import 'package:reddit_flutter/widget/loader.dart';
import 'package:reddit_flutter/widget/or_divider.dart';
import 'package:reddit_flutter/widget/text_field.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SigninScreen> createState() => _SigninState();
}

class _SigninState extends ConsumerState<SigninScreen> {
  //final GlobalKey _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  void signInAsGuest(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).signInAsGuest(context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    signInWithEmailAndPassword(context, ref, String email, String password) {
      ref
          .read(authControllerProvider.notifier)
          .signInWithEmailAndPassword(context, email, password);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => signInAsGuest(ref, context),
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Loader()
          : Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Signin Reddit made Flutter",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    EmailField(
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(height: 30),
                    PasswordField(
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                    const SizedBox(height: 30),
                    SignInButton(
                      onPressed: () {
                        signInWithEmailAndPassword(
                            context, ref, _email.trim(), _password.trim());
                      },
                    ),
                    const OrDivider(),
                    const GoogleSignInButton(),
                  ],
                ),
                const SwitchButton(),
              ],
            ),
    );
  }
}

class SignInButton extends ConsumerWidget {
  final void Function() onPressed;

  const SignInButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.greyColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          "Sign In",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SwitchButton extends StatelessWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupScreen(),
            ),
          );
        },
        child: const Text("Don't have account? Sign Up"),
      ),
    );
  }
}
