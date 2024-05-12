import 'package:flutter/material.dart';
import 'package:mauricourse/presentation/components/default_buttom.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/size_config.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body:  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          children: [
            Row(
              children: [
                spaceWidth(36),
                Image.asset(
                        "assets/images/logo.png",
                        height: getProportionateScreenWidth(150),
                      ),
                      
              ],
            ),
                  spaceHeight(40),
                  DefaultButton(
                    onTap: () {  },
                    text: 'Connecter',
                  ),
                  spaceHeight(20),
                  DefaultButton(
                    onTap: () {  },
                    text: 'Cree un Compte',
                  )
          ],
        ),
      ),
    ),
    );
  }
}