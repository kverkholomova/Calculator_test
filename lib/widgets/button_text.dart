
import 'package:calculator_test/constants.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String value;
  const ButtonText({
    Key? key, required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: kButtonText,
    );
  }
}
