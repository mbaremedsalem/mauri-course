import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/presentation/components/country_select.dart';
import 'package:mauricourse/presentation/components/default_buttom.dart';
import 'package:mauricourse/presentation/components/langue_select.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/size_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? password;
  String? uid;
  String? pays;
  final _formKey = GlobalKey<FormState>();
  final telephonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.only(top: getProportionateScreenHeight(20)),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.all(getProportionateScreenWidth(3)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: kgrey300),
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(12))),
                              child: TextFormField(
                                maxLength: 8,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                ],
                                controller: telephonecontroller,
                                validator: (value) {
                                  String pattern = r'^[0-9]*$';
                                  RegExp regExp = new RegExp(pattern);
        
                                  if (value!.isEmpty) {
                                    return getTranslated(context, "telobligatoire");
                                  } else {
                                    if (value.startsWith('2') ||
                                        value.startsWith('3') ||
                                        value.startsWith('4')) {
                                      if (value.length == 8) {
                                        if (regExp.hasMatch(value)) {
                                          return null;
                                        } else {
                                          return getTranslated(
                                              context, "telnonvalide");
                                        }
                                      } else {
                                        return getTranslated(
                                            context, "telnonvalide");
                                      }
                                    } else {
                                      return getTranslated(context, "telnonvalide");
                                    }
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration: textformdecoration.copyWith(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: getProportionateScreenWidth(20),
                                      vertical: getProportionateScreenHeight(10)),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: getProportionateScreenHeight(10),
                                        horizontal: getProportionateScreenWidth(6)),
                                    child: SvgPicture.asset(
                                      "assets/icons/phone.svg",
                                      colorFilter:
                                          ColorFilter.mode(primarycolor, BlendMode.srcIn),
                                      height: 8,
                                    ),
                                  ),
                                  // hintText:
                                  //     getTranslated(context, 'Numéro de Téléphone'),
                                  labelText:
                                      getTranslated(context, 'Numéro de Téléphone'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      spaceHeight(10),
                      Container(
                          width: SizeConfig.screenWidth! - getProportionateScreenWidth(40),
                          margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                          ),
                          padding: EdgeInsets.only(
                              right: getProportionateScreenWidth(10),
                              left: getProportionateScreenWidth(10)),
                          decoration: BoxDecoration(
                              border: Border.all(color: kgrey300),
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(12))),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/password.svg",
                                colorFilter:
                                    const ColorFilter.mode(primarycolor, BlendMode.srcIn),
                                width: getProportionateScreenWidth(28),
                              ),
                              spaceWidth(8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spaceHeight(4),
                                  Text(getTranslated(context, "Mot de passe")!,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: getProportionateScreenWidth(12),
                                          fontWeight: FontWeight.w400,
                                          color: blackcolor)),
                                  SizedBox(
                                    width: SizeConfig.screenWidth! -
                                        getProportionateScreenWidth(100),
                                    child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: PinCodeTextField(
                                        enablePinAutofill: false,
                                        cursorHeight:
                                            getProportionateScreenWidth(20),
                                        appContext: context,
                                        pastedTextStyle: const TextStyle(
                                          color: kgrey500,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        length: 4,
                                        animationType: AnimationType.fade,
                                        validator: (v) {
                                          if (v!.isEmpty) {
                                            return "";
                                          } else {
                                            if (v.length == 4) {
                                              return null;
                                            }
                                            return "";
                                          }
                                        },
                                        pinTheme: PinTheme(
                                            borderWidth: 1,
                                            selectedColor: colorSurfaceElement,
                                            inactiveColor: colorSurfaceElement,
                                            activeColor: colorSurfaceElement,
                                            selectedFillColor: colorSurfaceElement,
                                            inactiveFillColor: colorSurfaceElement,
                                            activeFillColor: colorSurfaceElement,
                                            shape: PinCodeFieldShape.box,
                                            borderRadius: BorderRadius.circular(
                                                getProportionateScreenWidth(10)),
                                            fieldHeight:
                                                getProportionateScreenHeight(48),
                                            fieldWidth:
                                                getProportionateScreenWidth(64),
                                            fieldOuterPadding: EdgeInsets.only(
                                                top: getProportionateScreenHeight(
                                                    8))),
                                        obscuringWidget: Icon(
                                          Icons.circle,
                                          color: blackcolor,
                                          size: getProportionateScreenWidth(22),
                                        ),
                                        cursorColor: blackcolor,
                                        enableActiveFill: true,
                                        keyboardType:
                                            const TextInputType.numberWithOptions(),
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      // devTestBanner(),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     builder: (context) => ForgetPassword());
                          // Navigator.of(context).pushNamed("restore_password",
                          //     arguments: telephonecontroller.text);
                        },
                        child: Text(
                          getTranslated(context, "Mot de passe oublié ?")!,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: kgrey800,
                              fontSize: getProportionateScreenWidth(12),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                
                     Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: 
                        DefaultButton(
                          height: getProportionateScreenHeight(45),
                          text: getTranslated(context, "Connexion"),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              // BlocProvider.of<LoginCubit>(context).login(
                              //     telephonecontroller.text, password, uid, context);
                            }
                          },
                          color: primarycolor,
                          textcolor: whitecolor,
                        ),
                      ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<String>(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        getProportionateScreenHeight(20)),
                                    topRight: Radius.circular(
                                        getProportionateScreenHeight(20)))),
                            builder: (BuildContext context) {
                              return CountrySelect(
                                country: pays,
                              );
                            },
                          ).then((value) {
                            setState(() {
                              if (value != null && value != '') {
                                pays = value;
                              }
                            });
                            
                          });
                        },
                        child: Text(
                          getTranslated(context, "Changer le pays (MR)")!,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: kgrey700,
                            fontSize: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      
                      Icon(
                        Icons.circle,
                        color: kgrey700,
                        size: getProportionateScreenWidth(4),
                      ),
        
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<String>(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        getProportionateScreenHeight(20)),
                                    topRight: Radius.circular(
                                        getProportionateScreenHeight(20)))),
                            builder: (BuildContext context) {
                              return const LangueSelect();
                            },
                          );
                        },
                        child: Text(
                          getTranslated(context, "Changer la langue")!,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: kgrey700,
                            fontSize: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                spaceHeight(10),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => Contactus()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    height: getProportionateScreenHeight(45),
                    decoration: BoxDecoration(
                        border: Border.all(color: kgrey300),
                        borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(12)),
                        color: whitecolor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/chat.svg",
                          colorFilter:
                              const ColorFilter.mode(blackcolor, BlendMode.srcIn),
                          width: getProportionateScreenWidth(24),
                        ),
                        spaceWidth(10),
                        Text(
                          getTranslated(context, "Contactez-nous")!,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: blackcolor,
                            fontSize: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                spaceHeight(20),
              ],
            )
     ;
  }
}