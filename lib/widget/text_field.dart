import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final void Function(String value) onChanged;

  const EmailField({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextFormField(
        autofillHints: const [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        decoration: TextFormStyle.onGeneral(iconData: Icons.email),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final void Function(String value) onChanged;

  const PasswordField({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextFormField(
        autofillHints: const [AutofillHints.password],
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChanged,
        decoration: TextFormStyle.onPassword(),
      ),
    );
  }
}

class TextFormStyle {
  TextFormStyle();

  static InputDecoration onGeneral({required IconData iconData}) =>
      InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: "Email",
        prefixIcon: Icon(
          iconData,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.pink),
          borderRadius: BorderRadius.circular(10),
        ),
      );

  static InputDecoration onPassword() => InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: "Password",
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.pink),
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
