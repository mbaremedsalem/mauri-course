import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/presentation/screens/onboarding/onboarding.dart';
import 'package:mauricourse/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
    void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3600), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Onboarding()));
      // Navigator.pushNamedAndRemoveUntil(context, loginPage, (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
              child:  Row(
              children: [
                spaceWidth(80),
                Image.asset(
                        "assets/images/logo.png",
                        height: getProportionateScreenWidth(200),
                      ),
                      
              ],
              ),
            ),

    );
  }


}