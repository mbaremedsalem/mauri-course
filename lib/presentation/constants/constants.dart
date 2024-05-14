import 'package:flutter/material.dart';
import 'package:mauricourse/size_config.dart';


const primarycolor = Color(0xFF314905);
const plightcolor = Color.fromARGB(39, 35, 89, 175);
const secondaryColor = Color(0xFF2359AF);
const warningcolor = Color(0xFFF0810F);
const blackcolor = Color(0xFF000000);
const whitecolor = Color(0xFFFFFFFF);
const redcolor = Color(0xFFDC2626);
const darkredcolor = Color(0xFF7F1D1D);
const redlightcolor = Color(0xFFFEF2F2);
const greylightycolor = Color(0xFFF4F4F5);
final kgrey100 = Colors.grey.shade100;
final kgrey200 = Colors.grey.shade200;
final kgrey300 = Colors.grey.shade300;
final kgrey400 = Colors.grey.shade400;
const kgrey500 = Color(0xFF737373);
const kgrey700 = Color(0xFF525252);
const kgrey800 = Color(0xFF3F3B3C);
const kgrey900 = Color(0xFF171717);
const greencolor = Color(0xFF14532D);
final green50 = Colors.green.shade50;
const colorBorderElement = Color(0xFFD3D4DB);
final green100 = Colors.green.shade100;
final red100 = Colors.red.shade100;
final blue100 = Colors.blue.shade100;
final blue50 = Colors.blue.shade50;
const kGreyColor = Color(0xff8A959E);
const colorSurfaceContainerSuccess = Color(0xFFE9F9EE);
const colorSurfaceElement = Color(0xFFF2F2F5);
const colorSurfaceDefault = Color(0xFFFCFCFD);
const colorBorder = Color(0xFFD4D4D4);
const colorTextMuted = Color(0xFFA3A3A3);
TextStyle textstyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: getProportionateScreenWidth(14),
    fontWeight: FontWeight.w400,
    color: Colors.black);

final textformdecoration = InputDecoration(
  contentPadding: EdgeInsets.only(
      left: getProportionateScreenWidth(15),
      right: getProportionateScreenWidth(15)),
  errorMaxLines: 4,
  errorStyle: textstyle.copyWith(
      color: redcolor, fontSize: getProportionateScreenWidth(12)),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade600),
    borderRadius:
        BorderRadius.all(Radius.circular(getProportionateScreenWidth(7))),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300),
    borderRadius:
        BorderRadius.all(Radius.circular(getProportionateScreenWidth(7))),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade600),
    borderRadius:
        BorderRadius.all(Radius.circular(getProportionateScreenWidth(7))),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300),
    borderRadius:
        BorderRadius.all(Radius.circular(getProportionateScreenWidth(7))),
  ),
  fillColor: kgrey100,
  filled: true,
);

Widget spaceHeight(double height) {
  return SizedBox(height: getProportionateScreenHeight(height));
}

Widget spaceWidth(double width) {
  return SizedBox(width: getProportionateScreenWidth(width));
}

void getTo(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void getOffTo(BuildContext context, String route) {
  Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
}

void getPop(BuildContext context) {
  Navigator.pop(context);
}
