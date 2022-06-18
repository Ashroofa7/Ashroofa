abstract class SocialMainStates {}

class InitialStates extends SocialMainStates {}

class MainGetDataLoading extends SocialMainStates {}

class MainGetDataSuccess extends SocialMainStates {}

class MainGetDataError extends SocialMainStates {
  final String error;

  MainGetDataError(this.error);
}

class ChangeBottomNav extends SocialMainStates {}

class New_Post extends SocialMainStates {}

class Changeprofilesuccess extends SocialMainStates {}

class Changeprofileerror extends SocialMainStates {}

class ProfileUploadSuccessful extends SocialMainStates {}

class ProfileUploadError extends SocialMainStates {}

class CoverUploadSuccessful extends SocialMainStates {}

class CoverUploadError extends SocialMainStates {}
