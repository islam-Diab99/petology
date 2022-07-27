import '../../../models/login_model.dart';


abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class ShopLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}
class FaceBookLoginSuccessState extends LoginStates {
  final Uri uri;

  FaceBookLoginSuccessState(this.uri);
}