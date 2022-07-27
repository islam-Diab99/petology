import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/screens/register/viewmodel/register_states.dart';

import '../../../Network/dio_helper.dart';
import '../../../Network/end_points.dart';
import '../../../models/login_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
RegisterCubit() : super(RegisterInitialState());

static RegisterCubit get(context) => BlocProvider.of(context);

late LoginModel loginModel;

void userRegister({
  required String firstName,
  required String lastName,
  required String email,
  required String password,
  required String country,
  required String phoneNumber,

}) {
  emit(RegisterLoadingState());

  DioHelper.postData(
    url: REGISTER,
    data: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'country': country,
      "phoneNumber": phoneNumber,

    },
  ).then((value) {
    loginModel = LoginModel.fromJson(value.data);
    print(value.data);
    emit(RegisterSuccessState(loginModel));
  }).catchError((error) {
    emit(RegisterErrorState(error.toString()));
    print(error.toString());
  });
}


}
