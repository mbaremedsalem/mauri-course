import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/data/models/Language.dart';
import 'package:mauricourse/main.dart';
import 'package:mauricourse/presentation/components/default_buttom.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/presentation/screens/onboarding/onboarding.dart';
import 'package:mauricourse/size_config.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  int index = 0;

  FlutterSecureStorage storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
            width: SizeConfig.screenWidth,
            // height: getProportionateScreenHeight(490),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
              children: [
                    spaceHeight(40),
                   Center(   
                child:Image.asset(
                        "assets/images/logo.png",
                        height: getProportionateScreenWidth(100),
                      ),
            ),
                  Text(
                    getTranslated(context, "Choisir la langue")!,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getProportionateScreenWidth(20),
                        color: blackcolor),
                  ),
                  spaceHeight(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _changeLanguage(
                            Language(2, "🇸🇦", "اَلْعَرَبِيَّةُ‎", "ar"),
                          );
                        },
                        child: Container(
                          height: getProportionateScreenWidth(110),
                          width: getProportionateScreenWidth(113),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Localizations.localeOf(context)
                                          .languageCode ==
                                      "ar"
                                  ? primarycolor
                                  : kgrey300,
                            ),
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(12)),
                            color:
                                Localizations.localeOf(context).languageCode ==
                                        "ar"
                                    ? secondaryColor
                                    : whitecolor
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/arabe.png',
                                    width: getProportionateScreenWidth(40),
                                  ),
                                  Text(
                                    getTranslated(context, "ar")!,
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        color: blackcolor),
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Localizations.localeOf(context)
                                              .languageCode ==
                                          "ar"
                                      ? SvgPicture.asset(
                                          'assets/icons/CheckCircle.svg',
                                          colorFilter: const ColorFilter.mode(
                                              primarycolor, BlendMode.srcIn),
                                        )
                                      : Container())
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _changeLanguage(
                            Language(1, "fr", "Francais", "fr"),
                          );
                        },
                        child: Container(
                          height: getProportionateScreenWidth(110),
                          width: getProportionateScreenWidth(113),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Localizations.localeOf(context)
                                          .languageCode ==
                                      "fr"
                                  ? primarycolor
                                  : kgrey300,
                            ),
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(12)),
                            color:
                                Localizations.localeOf(context).languageCode ==
                                        "fr"
                                    ? secondaryColor
                                    : whitecolor,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/french.png',
                                    width: getProportionateScreenWidth(40),
                                  ),
                                  Text(
                                    getTranslated(context, "fr")!,
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        color: blackcolor),
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Localizations.localeOf(context)
                                              .languageCode ==
                                          "fr"
                                      ? SvgPicture.asset(
                                          'assets/icons/CheckCircle.svg',
                                          colorFilter: const ColorFilter.mode(
                                              primarycolor, BlendMode.srcIn),
                                        )
                                      : Container())
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _changeLanguage(
                            Language(3, "en", "English", "en"),
                          );
                        },
                        child: Container(
                          height: getProportionateScreenWidth(110),
                          width: getProportionateScreenWidth(113),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Localizations.localeOf(context)
                                          .languageCode ==
                                      "en"
                                  ? primarycolor
                                  : kgrey300,
                            ),
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(12)),
                            color:
                                Localizations.localeOf(context).languageCode ==
                                        "en"
                                    ? secondaryColor
                                    : whitecolor,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/english.png',
                                    width: getProportionateScreenWidth(40),
                                  ),
                                  Text(
                                    getTranslated(context, "en")!,
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        color: blackcolor),
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Localizations.localeOf(context)
                                              .languageCode ==
                                          "en"
                                      ? SvgPicture.asset(
                                          'assets/icons/CheckCircle.svg',
                                          colorFilter: const ColorFilter.mode(
                                              primarycolor, BlendMode.srcIn),
                                        )
                                      : Container())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    child: DefaultButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Onboarding()));
                        setState(() {
                          index = 1;
                        });
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
                  ),
                ],
              ),
            ),
          )
        ,
    );
  }
}
