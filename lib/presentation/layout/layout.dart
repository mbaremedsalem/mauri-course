
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauricourse/business_logic/layout_cubit/cubit.dart';
import 'package:mauricourse/business_logic/layout_cubit/state.dart';
import 'package:mauricourse/data/localization/langue_constants.dart';
import 'package:mauricourse/presentation/constants/constants.dart';
import 'package:mauricourse/size_config.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = LayoutCubit.get(context);
          return SafeArea(
      child:  Scaffold(
        backgroundColor: whitecolor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 18),
            
              child: Column(
                children: [
                  Container(
                    color: whitecolor,
                    child: Row(
                      children: [
                        Image.asset('assets/images/logo.png',
                        width: getProportionateScreenWidth(90),),
                        const Spacer(),
                        Text(
                          getTranslated(context, "pageAceuile")!,
                          style: const TextStyle(
                            color: primarycolor,
                            fontWeight: FontWeight.w500,fontSize: 30,
                          ),
                          ),
                      ],
                    ),
                  ),
                 cubit.bottomScreen[cubit.currentIndex],
              ],
             
              ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home,color: primarycolor,),
              icon: Icon(Icons.home, color: Colors.black,),
              label: ''
              ),
              BottomNavigationBarItem(
              activeIcon: Icon(Icons.category,color: primarycolor,),
              icon: Icon(Icons.category, color: Colors.black,),
              label: ''
              ),
              BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite,color: primarycolor,),
              icon: Icon(Icons.favorite, color: Colors.black,),
              label: ''
              ),
              BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings,color: primarycolor,),
              icon: Icon(Icons.settings, color: Colors.black,),
              label: ''
              )
          ],
          onTap: (index){
            cubit.changeBottom(index);
          },
          ),
      ),
    );
        },
      ),
    );
  
    
  }
}