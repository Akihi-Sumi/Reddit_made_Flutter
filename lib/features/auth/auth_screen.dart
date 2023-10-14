import 'package:flutter/material.dart';
import 'package:reddit_flutter/features/auth/signin_screen.dart';
import 'package:reddit_flutter/features/auth/signup_screen.dart';
import 'package:reddit_flutter/widget/auth_switch_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  bool showSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 250, 16, 0),
            child: showSignIn ? const SigninScreen() : const SignupScreen(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: showSignIn
                  ? const Text(
                      "Welcom Back",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    )
                  : const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
            ),
          ),
          AuthSwitchButton(
            showSignIn: showSignIn,
            onTap: () {
              showSignIn = !showSignIn;
            },
          ),
        ],
      ),
    );
  }
}
