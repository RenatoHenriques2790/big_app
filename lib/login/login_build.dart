import 'package:flutter/material.dart';
import 'package:big_app/common/widgets/constants/constants.dart';
import 'package:big_app/common/widgets/field.dart';

class LoginBuild extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback performLogin;

  const LoginBuild({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.performLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField().buildTextLabel(Constants.username, usernameController),
        const SizedBox(height: 16),
        CustomTextField().buildTextLabel(Constants.password, passwordController, obscure: true),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: performLogin,
          child: const Text(Constants.loginButton),
        ),
      ],
    );
  }
}