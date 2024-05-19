import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mauricourse/business_logic/login_cubit/state.dart';
import 'package:mauricourse/data/models/login_model.dart';
import 'package:mauricourse/presentation/constants/strings.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin({
    required String phone,
    required String password,
  }) async {
    print('++++++++++++');
    const storage = FlutterSecureStorage();
    emit(LoginLoadingState());
    try {
      final response = await http.post(
        Uri.parse(baseUrl+login), // Assuming login is your URL
        body: {
          'phone':'41479873',
          'password':'1234',
        },
      );
      print('--------------');
      if (response.statusCode == 200) {
        final value = json.decode(response.body);
        await storage.write(key: "token", value: value["access"]);
        await storage.write(key: "role", value: value["role"]);

        loginModel = LoginModel.fromJason(value);
        emit(LoginSuccessState(loginModel!));
      } else {
        emit(LoginErrorState("Invalid credentials"));
      }
    } catch (_) {
      emit(LoginErrorState("Invalid credentials"));
    }
  }
}