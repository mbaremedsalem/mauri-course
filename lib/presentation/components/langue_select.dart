import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/data/models/Language.dart';
import 'package:mauricourse/main.dart';
import 'package:mauricourse/presentation/components/default_buttom.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/size_config.dart';

class LangueSelect extends StatefulWidget {
  final String? country;
  const LangueSelect({this.country, super.key});

  @override
  State<LangueSelect> createState() => _LangueSelectState();
}

class _LangueSelectState extends State<LangueSelect> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            spaceHeight(40),
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
                    // _changeLanguage(
                    //   Language(2, "🇸🇦", "اَلْعَرَبِيَّةُ‎", "ar"),
                    // );
                  },
                  child: Container(
                    height: getProportionateScreenWidth(110),
                    width: getProportionateScreenWidth(113),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color:
                            Localizations.localeOf(context).languageCode == "ar"
                                ? primarycolor
                                : colorBorderElement,
                      ),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(12)),
                      color:
                          Localizations.localeOf(context).languageCode == "ar"
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
                              'assets/images/arabe.png',
                              width: getProportionateScreenWidth(40),
                            ),
                            Text(
                              getTranslated(context, "ar")!,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: getProportionateScreenWidth(14),
                                  color: blackcolor),
                            ),
                          ],
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child:
                                Localizations.localeOf(context).languageCode ==
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
                        color:
                            Localizations.localeOf(context).languageCode == "fr"
                                ? primarycolor
                                : colorBorderElement,
                      ),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(12)),
                      color:
                          Localizations.localeOf(context).languageCode == "fr"
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
                                  fontSize: getProportionateScreenWidth(14),
                                  color: blackcolor),
                            ),
                          ],
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child:
                                Localizations.localeOf(context).languageCode ==
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
                    // _changeLanguage(
                    //   Language(3, "en", "English", "en"),
                    // );
                  },
                  child: Container(
                    height: getProportionateScreenWidth(110),
                    width: getProportionateScreenWidth(113),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color:
                            Localizations.localeOf(context).languageCode == "en"
                                ? primarycolor
                                : colorBorderElement,
                      ),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(12)),
                      color:
                          Localizations.localeOf(context).languageCode == "en"
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
                                  fontSize: getProportionateScreenWidth(14),
                                  color: blackcolor),
                            ),
                          ],
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child:
                                Localizations.localeOf(context).languageCode ==
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
                  Navigator.pop(context);
                },
                color: primarycolor,
                textcolor: whitecolor,
                text: getTranslated(context, "confirmer"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
