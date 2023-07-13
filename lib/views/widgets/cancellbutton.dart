import 'package:flutter/material.dart';

class CancellBttn extends StatelessWidget {
  const CancellBttn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.pop(context), child: const Text("Cancell"));
  }
}
