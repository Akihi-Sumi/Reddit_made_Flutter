import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutter/features/auth/auth_controller.dart';
import 'package:reddit_flutter/theme/palette.dart';
import 'package:reddit_flutter/widget/loader.dart';
import 'package:reddit_flutter/widget/text_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _SignupState();
}

class _SignupState extends ConsumerState<SignupScreen> {
  String _name = "";
  String _email = "";
  String _password = "";

  void signInAsGuest(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).signInAsGuest(context);
  }

  signUpWithEmailAndPassword(BuildContext context, WidgetRef ref, String name,
      String email, String password) {
    ref
        .read(authControllerProvider.notifier)
        .signUpWithEmailAndPassword(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

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
          : Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Create account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 30),
                NameField(onChanged: (value) {
                  _name = value;
                }),
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
                SignUpButton(
                  onPressed: () {
                    signUpWithEmailAndPassword(context, ref, _name.trim(),
                        _email.trim(), _password.trim());
                  },
                ),
              ],
            ),
    );
  }
}

class SignUpButton extends ConsumerWidget {
  final void Function() onPressed;

  const SignUpButton({Key? key, required this.onPressed}) : super(key: key);

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
          "Sign Up",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
