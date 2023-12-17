import 'package:ecommerce_major_project/features/splash/widgets/body.dart';
import 'package:ecommerce_major_project/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    // You have to call it on your starting screen
    // SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
