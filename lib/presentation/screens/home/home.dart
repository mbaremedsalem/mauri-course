import 'package:flutter/material.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/presentation/components/default_buttom.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/size_config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:  Column(
      children: [
        Row(
          children: [
            DefaultButton(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Onboarding()));
                            // setState(() {
                            //   index = 1;
                            // });
                          },
                          color: primarycolor,
                          textcolor: whitecolor,
                          text: getTranslated(context, "suivant")!,
                          // hasIcon: true,
                          suffixIcon: Icon(
                            Icons.arrow_forward,
                            color: whitecolor,
                            size: getProportionateScreenWidth(24),
                          ),
                        ),
          
            const CircleAvatar(radius: 20,)
          ],
        ),
      ],
      ),
    );
  }
}