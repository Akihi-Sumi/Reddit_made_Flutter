import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 2)),
          Text(
            "OR",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Expanded(child: Divider(thickness: 2)),
        ],
      ),
    );
  }
}
