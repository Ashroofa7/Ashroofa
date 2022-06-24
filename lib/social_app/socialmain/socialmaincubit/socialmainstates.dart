abstract class SocialMainStates {}

class InitialStates extends SocialMainStates {}

//get user

class MainGetDataLoading extends SocialMainStates {}

class MainGetDataSuccess extends SocialMainStates {}

class MainGetDataError extends SocialMainStates {
  final String error;

  MainGetDataError(this.error);
}

//change bottomsheet

class ChangeBottomNav extends SocialMainStates {}

class New_Post extends SocialMainStates {}

//change profile

class Changeprofilesuccess extends SocialMainStates {}

class Changeprofileerror extends SocialMainStates {}

//change cover
class Changecoversuccess extends SocialMainStates {}

class Changecovererror extends SocialMainStates {}

//upload profile
class ProfileUploadSuccessful extends SocialMainStates {}

class ProfileUploadError extends SocialMainStates {}

//upload cover
class CoverUploadSuccessful extends SocialMainStates {}

class CoverUploadError extends SocialMainStates {}

// update loading profile and cover indecator
class updateProfileindecator extends SocialMainStates {}

class updateCoverindecator extends SocialMainStates {}

// update user date indecator
class updateUserindecator extends SocialMainStates {}

class updatePostindecator extends SocialMainStates {}

//get post image

class postImageUploadsuccess extends SocialMainStates {}

class postImageUploaderror extends SocialMainStates {}

// Upload Post
class PostUploadSuccessful extends SocialMainStates {}

class PostUploadError extends SocialMainStates {}

//loading create post
class LoadingCreatepost extends SocialMainStates {}

//close image post from
class closepostImage extends SocialMainStates {}

// get posts
class GetPostsSuccessful extends SocialMainStates{}

class GetPostsError extends SocialMainStates{}

