import 'package:big_app/common/widgets/button.dart';
import 'package:big_app/common/widgets/constants/constants.dart';
import 'package:big_app/common/widgets/constants/routesConst.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialBuild {
  const InitialBuild();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            SimpleButton(goRoute: RoutesConst.login, label: Constants.authenticationButton, backgroundColor: Colors.blue, foregroundColor: Colors.white),
            const SizedBox(height: 20),
            SimpleButton(goRoute: RoutesConst.dashboard, label: Constants.anonymousButton, backgroundColor: Colors.grey, foregroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
  
}