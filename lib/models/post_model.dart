class Create_Post_Model{
   late String uId;
   late String post_Image;
   late String text;
   late String datetime;
   late String profileimage;
   late String name;



  Create_Post_Model({
    required this.uId,
    required this.datetime,
    required this.text,
    required this.post_Image,
    required this.profileimage,
    required this.name,

  });


  Create_Post_Model.fromJson(Map<String,dynamic>?json){

    uId=json? ['uId'];
    post_Image=json? ['post_Image'];
    datetime=json? ['datetime'];
    text=json? ['text'];
    profileimage=json? ['profileimage'];
    name=json? ['name'];

  }


  Map<String,dynamic> toMap(){
    return {

      'uId': uId,
      'name': name,
      'post_Image':post_Image,
      'text':text,
      'datetime':datetime,
      'profileimage':profileimage,
    };
  }

}