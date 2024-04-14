import 'package:chatzen/components/form_input.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool visible = false;
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormInput(
      placeholder: "Password",
      validate: validate,
      visibility: visible,
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
          icon: Icon(
            visible ? Icons.visibility_rounded : Icons.visibility_off,
            size: 20,
          )),
      prefixIcon: Icon(
        Icons.lock_rounded,
        size: 20,
      ),
    );
  }
}
