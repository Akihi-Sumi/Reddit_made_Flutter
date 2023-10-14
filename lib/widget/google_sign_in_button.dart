import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutter/core/constants/constants.dart';
import 'package:reddit_flutter/features/auth/auth_controller.dart';
import 'package:reddit_flutter/theme/palette.dart';

class GoogleSignInButton extends ConsumerWidget {
  final bool isFromLogin;
  const GoogleSignInButton({Key? key, this.isFromLogin = true})
      : super(key: key);

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref
        .read(authControllerProvider.notifier)
        .signInWithGoogle(context, isFromLogin);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(context, ref),
        icon: Image.asset(
          Constants.googlePath,
          width: 35,
        ),
        label: const Text(
          "Continue with Google",
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.greyColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
