import 'package:big_app/common/widgets/button.dart';
import 'package:big_app/common/widgets/constants/constants.dart';
import 'package:big_app/common/widgets/constants/routesConst.dart';
import 'package:flutter/material.dart';

class DashboardBuild {
  const DashboardBuild();


  Widget build(BuildContext context, Map<String, dynamic>? userInfo) {
    final bool isAnonymous = userInfo == null || userInfo['username'] == null;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.dashboardTitle),
      ),
      body: Center(
        child: isAnonymous
    ? const Text(
        Constants.welcomeAnonymous,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      )
    : Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.person, size: 28, color: Colors.blueAccent),
                  const SizedBox(width: 10),
                  Text(
                    'Welcome, ${userInfo['firstName']} ${userInfo['lastName']}!',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.email, size: 22, color: Colors.greenAccent),
                  const SizedBox(width: 8),
                  Text(userInfo['email']),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.account_circle, size: 22, color: Colors.purple),
                  const SizedBox(width: 8),
                  Text(userInfo['username']),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.cake, size: 22, color: Colors.yellowAccent),
                  const SizedBox(width: 8),
                  Text(userInfo['birthDate']),
                ],
              )
            ],
          ),
        ),
      ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const SizedBox(height: 20),
            SimpleButton( goRoute: RoutesConst.initial, 
                          label: Constants.logoutButton, 
                          backgroundColor: Colors.red, 
                          foregroundColor: Colors.white),
          ],
      ),
    ),
    );    
  }
}