import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Network/dio_helper.dart';
import '../../../Network/end_points.dart';
import '../../../models/login_model.dart';
import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  userLogin({required String email, required String password}) {
    emit(ShopLoadingState());
    DioHelper.postData(url: login, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));

    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      if (kDebugMode) {
        print(error);
      }
    });
  }

  faceBookLogin(){

    DioHelper.getData(url: facebookLogin,)
        .then((value) {
          print(value.realUri);
          emit(FaceBookLoginSuccessState(value.realUri));


    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
    });

  }


}
