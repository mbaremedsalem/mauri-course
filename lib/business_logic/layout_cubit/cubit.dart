import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauricourse/business_logic/layout_cubit/state.dart';
import 'package:mauricourse/presentation/screens/chats/chat.dart';
import 'package:mauricourse/presentation/screens/home/home.dart';
import 'package:mauricourse/presentation/screens/notification/notification.dart';

import 'package:mauricourse/presentation/screens/settings/settings.dart';






class LayoutCubit extends Cubit<LayoutStates>
{
  LayoutCubit():super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreen = [
       const Home(),
       const Chat(),
       const Notifications(),
       const Settings(),
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}