import 'package:big_app/common/widgets/error_handler.dart';
import 'package:big_app/login/login_build.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:big_app/common/widgets/constants/routesConst.dart';
import 'package:big_app/common/widgets/constants/constants.dart';
import 'package:big_app/user/login_dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final dio = Dio();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _performLogin() async {
  try {
    final response = await LoginDio().login(
      _usernameController.text,
      _passwordController.text,
    );

    if (response.statusCode == Constants.loginSuccess) {
      if (mounted) {
        GoRouter.of(context).go(RoutesConst.dashboard);
      }
    }
  } on DioException catch (e) {
    if (mounted) {
      if (e.response?.statusCode == Constants.loginFailure) {
        ErrorHandler.showSnackBar(context, Constants.loginUserFailureMessage);
      } else {
        ErrorHandler.showSnackBar(context, "Error: ${e.message}");
      }
    }
  } catch (e) {
    if (mounted) {
      ErrorHandler.showSnackBar(context, "Unexpected error: $e");
    }
  }
}

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: LoginBuild(
          usernameController: _usernameController,
          passwordController: _passwordController,
          performLogin: _performLogin,
        ),
      ),
    );
  }
}