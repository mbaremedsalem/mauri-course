import 'package:flutter/material.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/presentation/components/default_buttom.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/presentation/screens/login/index_login.dart';
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
            Center(   
                child:Image.asset(
                        "assets/images/logo.png",
                        height: getProportionateScreenWidth(100),
                      ),
            ),
                  spaceHeight(40),
                  DefaultButton(
                    onTap: () {  
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const IndexLogin()));
                    },
                    text: getTranslated(context, "Connexion")!,
                  ),
                  spaceHeight(20),
                  DefaultButton(
                    onTap: () {  },
                    text: getTranslated(context, "Créer un compte")!,
                  ),
          ],
        ),
      ),
    ),
    );
  }
}