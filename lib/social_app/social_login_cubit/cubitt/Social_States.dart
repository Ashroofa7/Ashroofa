abstract class Social_states{}

class InitialStates extends Social_states{}

class LoadingLoginSocial extends Social_states{}

class SuccesLoginSocial extends Social_states{
  final String Uid;

  SuccesLoginSocial(this.Uid);
}

class ErrorLoginSocial extends Social_states{
  final String error;

  ErrorLoginSocial(this.error);
}

class Changepassword extends Social_states{}