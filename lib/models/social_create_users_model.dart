class Create_User_model{
    late String name;
    late String email;
    late String phone;
    late String uId;
    late String Bio;
    late String profile_image;
    late String Cover_Image;

  Create_User_model({
    required this.email,
    required this.phone,
    required this.name,
    required this.uId,
    required this.Cover_Image,
    required this.profile_image,
    required this.Bio,
});


  Create_User_model.fromJson(Map<String,dynamic>?json){
    email=json? ['email'];
    phone=json? ['phone'];
    name=json? ['name'];
    uId=json? ['uId'];
    Bio=json? ['Bio'];
    Cover_Image=json? ['Cover_Image'];
    profile_image=json? ['profile_Image'];
  }


  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
      'Bio': Bio,
      'Cover_Image': Cover_Image,
      'profile_Image': profile_image,
    };
  }

}