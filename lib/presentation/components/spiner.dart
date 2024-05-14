import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mauricourse/presentation/constants/constants.dart';


import '../../size_config.dart';

Widget spiner({Color? color}) {
  return SpinKitThreeBounce(
    color:color?? plightcolor,
    size: getProportionateScreenWidth(25),
  );
}
