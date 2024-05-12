import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/presentation/components/default_buttom.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/size_config.dart';

class CountrySelect extends StatefulWidget {
  final String? country;
  const CountrySelect({this.country, super.key});

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  String? pays = 'Mauritania';
  FlutterSecureStorage storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    setState(() {
      pays = widget.country;
    });
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
              getTranslated(context, "Choisissez le pays")!,
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
                    setState(() {
                      pays = 'Mauritania';
                    });
                  },
                  child: Container(
                    height: getProportionateScreenWidth(85),
                    width: getProportionateScreenWidth(174),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: pays == 'Mauritania' ? primarycolor : kgrey300,
                      ),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(12)),
                      color: pays == 'Mauritania'
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
                              'assets/images/mauritanie.png',
                              width: getProportionateScreenWidth(40),
                            ),
                            Text(
                              getTranslated(context, "Mauritania")!,
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
                            child: pays == 'Mauritania'
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
                    setState(() {
                      pays = 'Senegal';
                    });
                  },
                  child: Container(
                    height: getProportionateScreenWidth(85),
                    width: getProportionateScreenWidth(174),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: pays == 'Senegal' ? primarycolor : kgrey300,
                      ),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(12)),
                      color:
                          pays == 'Senegal' ? secondaryColor : whitecolor,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/senegal.png',
                              width: getProportionateScreenWidth(40),
                            ),
                            Text(
                              getTranslated(context, "Senegal")!,
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
                            child: pays == 'Senegal'
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
            spaceHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pays = 'Mali';
                    });
                  },
                  child: Container(
                    height: getProportionateScreenWidth(85),
                    width: getProportionateScreenWidth(174),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: pays == 'Mali' ? primarycolor : kgrey300,
                      ),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(12)),
                      color: pays == 'Mali' ? secondaryColor : whitecolor,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/mali.png',
                              width: getProportionateScreenWidth(40),
                            ),
                            Text(
                              getTranslated(context, "Mali")!,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: getProportionateScreenWidth(14),
                                  color: blackcolor
                                  ),
                            ),
                          ],
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child: pays == 'Mali'
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
                    setState(() {
                      pays = 'Guinee';
                    });
                  },
                  child: Container(
                    height: getProportionateScreenWidth(85),
                    width: getProportionateScreenWidth(174),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: pays == 'Guinee' ? primarycolor : kgrey300,
                      ),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(12)),
                      color:
                          pays == 'Guinee' ? secondaryColor : whitecolor,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/guinee.png',
                              width: getProportionateScreenWidth(40),
                            ),
                            Text(
                              getTranslated(context, "Guinee")!,
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
                            child: pays == 'Guinee'
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
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultButton(
                    color: whitecolor,
                    textcolor: blackcolor,
                    hasborder: true,
                    // borderColor: kgrey300,
                    onTap: () {
                      Navigator.pop(context, '');
                    },
                    text: getTranslated(context, 'Retour'),
                    width: getProportionateScreenWidth(110),
                  ),
                  spaceWidth(5),
                  DefaultButton(
                    onTap: () async {
                      await storage.write(key: "country", value: pays);
                      Navigator.pop(context, pays);
                    },
                    width: getProportionateScreenWidth(240),
                    color: primarycolor,
                    textcolor: whitecolor,
                    text: getTranslated(context, "Confirmer"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
