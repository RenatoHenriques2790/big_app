import 'package:big_app/common/widgets/constants/constants.dart';
import 'package:big_app/dashboard/ds_build.dart';
import 'package:big_app/user/user_info_dio.dart';
import 'package:flutter/material.dart';




class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}


class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic>? userInfo;

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    final userInfoDio = UserInfoDio();
    final info = await userInfoDio.getUser(Constants.username);
    setState(() {
      userInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardBuild().build(context, userInfo);    
  }
}