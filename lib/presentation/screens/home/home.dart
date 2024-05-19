import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/presentation/components/default_buttom.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/presentation/screens/course/course.dart';
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
              Container(
                width: 440,
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                        height: 60,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                          backgroundColor: primarycolor,
                          ),
                          child: Text("M'bare Mohamed Salem",style: TextStyle(color: whitecolor),),
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/profile-anonymous-face-icon-gray-silhouette-person-male-businessman-profile-default-avatar-photo-placeholder-isolated-white-113133662.jpg',
                      ),
                    ),
                  ],
                ),
              ),
        SizedBox(height: 40,),
        Container(
          width: 440,
          height: 60,
          child: DefaultButton(
            onTap: (){},
            color: primarycolor,
            textcolor: whitecolor,
            text: getTranslated(context, "Langage Arabe")!,
            ),
        ),
        SizedBox(height: 12,),
        Container(
          width: 440,
          height: 60,
          child: DefaultButton(
            onTap: (){
              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  VideoPlayerScreen()),
                            
                          );
            },
            color: primarycolor,
            textcolor: whitecolor,
            text: getTranslated(context, "Education religieuse")!,
            ),
        ),
        SizedBox(height: 12,),
        Container(
          width: 440,
          height: 60,
          child: DefaultButton(
            onTap: (){},
            color: primarycolor,
            textcolor: whitecolor,
            text: getTranslated(context, "Pensée islamique")!,
            ),
        ),
        SizedBox(height: 12,),
        Container(
          width: 440,
          height: 60,
          child: DefaultButton(
            onTap: (){},
            color: primarycolor,
            textcolor: whitecolor,
            text: getTranslated(context, "Histoire géographique")!,
            ),
        ),
        SizedBox(height: 12,),
        Container(
          width: 440,
          height: 60,
          child: DefaultButton(
            onTap: (){},
            color: primarycolor,
            textcolor: whitecolor,
            text: getTranslated(context, "Mathématiques")!,
            ),
        ),     
      ],
      ),
    );
  }
}