import 'package:flutter/material.dart';
import 'package:stateless_statefull/utils/constsants/constants.dart';

class CancellBttn extends StatelessWidget {
  const CancellBttn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.pop(context), child: cancellText);
  }
}
