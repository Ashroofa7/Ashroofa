abstract class RegisterSocialStates{}

class InitialStates extends RegisterSocialStates{}

class LoadingRegisteSocialState extends RegisterSocialStates{}

class SuccessRegisterSocialState extends RegisterSocialStates{}

class ErrorRegisterSocialState extends RegisterSocialStates{
  final String error;
  ErrorRegisterSocialState(this.error);
}

class SuccessCreateUserState extends RegisterSocialStates{}

class ErrorCreateUserState extends RegisterSocialStates{
  final String error;
  ErrorCreateUserState(this.error);
}
class FinisheRegister extends RegisterSocialStates{}