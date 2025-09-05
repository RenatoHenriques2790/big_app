import 'package:big_app/initial/initial_build.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
  }

  Future<void> _checkTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    if (token != null && mounted) {
      prefs.remove('jwt_token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InitialBuild().build(context);
  }
}