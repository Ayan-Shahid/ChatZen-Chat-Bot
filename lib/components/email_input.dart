import 'package:chatzen/components/form_input.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FormInput(
      keyboardType: TextInputType.emailAddress,
      placeholder: "Email",
      prefixIcon: Icon(
        Icons.email_rounded,
        size: 20,
      ),
    );
  }
}
