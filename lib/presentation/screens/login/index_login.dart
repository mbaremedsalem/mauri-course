import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/presentation/screens/Register/register.dart';
import 'package:mauricourse/presentation/screens/Register/register_autre.dart';
import 'package:mauricourse/presentation/screens/login/login_screen.dart';
import 'package:mauricourse/size_config.dart';

class IndexLogin extends StatefulWidget {
  const IndexLogin({super.key});

  @override
  State<IndexLogin> createState() => _IndexLoginState();
}

class _IndexLoginState extends State<IndexLogin> {
  int currentState = 0;

  String? pays;

  final FlutterSecureStorage storage = FlutterSecureStorage();

  void fetch() async {
    String? t = await storage.read(key: "country");

    if (mounted) {
      setState(() {
        pays = t;
      });
    }
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: primarycolor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // spaceHeight(80),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: SizedBox(
                  width: SizeConfig.screenWidth! / 1.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        color: Colors.white,
                        colorBlendMode: BlendMode.srcIn,
                        width: getProportionateScreenWidth(100),
                      ),
                    
                      spaceHeight(10),
                      currentState == 0
                          ? Text(
                            getTranslated(context, "Bienvenue, connectez-vous à votre compte")!,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(20),
                                  color: whitecolor,
                                  fontWeight: FontWeight.w400))
                          : Text(getTranslated(context, "Inscrivez-vous et profitez d'une expérience Apprentissage.")!,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(20),
                                  color: whitecolor,
                                  fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getProportionateScreenWidth(20)),
                      topRight:
                          Radius.circular(getProportionateScreenWidth(20)),
                    ),
                    color: whitecolor),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spaceHeight(20),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15)),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: kgrey200,
                            ),
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(20)),
                            color: kgrey100),
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(2),
                            vertical: getProportionateScreenHeight(2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentState = 0;
                                });
                              },
                              child: Container(
                                height: getProportionateScreenHeight(41),
                                width: getProportionateScreenWidth(168),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(20)),
                                  color: currentState == 0
                                      ? whitecolor
                                      : kgrey100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: currentState == 0
                                          ? kgrey300
                                          : kgrey100,
                                      offset: const Offset(
                                        0.0,
                                        0.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(getTranslated(context, 'Connexion')!,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(14),
                                          color: blackcolor,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                String? t = await storage.read(key: "country");

                                if (mounted) {
                                  setState(() {
                                    pays = t;
                                    currentState = 1;
                                  });
                                }
                              },
                              child: Container(
                                height: getProportionateScreenHeight(41),
                                width: getProportionateScreenWidth(168),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(20)),
                                  color: currentState == 1
                                      ? whitecolor
                                      : kgrey100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: currentState == 1
                                          ? kgrey300
                                          : kgrey100,
                                      offset: const Offset(
                                        0.0,
                                        0.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(getTranslated(context, 'réer un compte')!,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(14),
                                          color: blackcolor,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: SizeConfig.screenHeight! / 1.5,
                          child: currentState == 0
                              ? const LoginScreen()
                              : pays == 'Mauritania'
                                  ? const Register()
                                  : const RegisterAutres())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
