import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/Components/components.dart';
import 'package:socialapp/models/post_model.dart';
import 'package:socialapp/models/social_create_users_model.dart';
import 'package:socialapp/social_app/modules/friends/friends.dart';
import 'package:socialapp/social_app/modules/home/home.dart';
import 'package:socialapp/social_app/modules/newPost/newPost.dart';
import 'package:socialapp/social_app/modules/settings/settings.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmainstates.dart';
import '../../modules/chat/chat.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialMainCubit extends Cubit<SocialMainStates> {
  SocialMainCubit() : super(InitialStates());

  static SocialMainCubit get(context) => BlocProvider.of(context);

  late Create_User_model model;
  late Create_Post_Model postmodel;

  //get user data
  void getUserData() {
    emit(MainGetDataLoading());

    FirebaseFirestore.instance.collection('User1').doc(uId).get().then((value) {
      model = Create_User_model.fromJson(value.data());
      emit(MainGetDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(MainGetDataError(error));
    });
  }

  int currentindex = 0;

  //title list
  List<String> titles = [
    'News Feed',
    'Chats',
    'New Post',
    'Friends',
    'Settings',
  ];

  // widget of bottom nav list
  List<Widget> Screens = [
    Home(),
    Chat(),
    NewPost(),
    Friends(),
    Setti(),
  ];
  //change bottom sheet
  void changeIndex(int index) {
    if (index == 2)
      emit(New_Post());
    else
      currentindex = index;
    print(index);
    emit(ChangeBottomNav());
  }

  // get profile image
  File? profileImage;
  var picker = ImagePicker();
  Future<void> getprofileimage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      profileImage = File(pickedFile!.path);
      emit(Changeprofilesuccess());
    } else {
      print('No Image Selected');
      emit(Changeprofileerror());
    }
  }

//  get cover image
  File? coverImage;
  Future<void> getcoverimage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      coverImage = File(pickedFile!.path);
      emit(Changecoversuccess());
    } else {
      print('No Image Selected');
      emit(Changecovererror());
    }
  }

// upload profile image
  void UploadProfileImage() {
    emit(updateProfileindecator());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        model.profile_image = value;
        FirebaseFirestore.instance
            .collection('User1')
            .doc(model.uId)
            .update(model.toMap())
            .then((value) {
          getUserData();
        }).catchError((error) {});
        emit(ProfileUploadSuccessful());
      }).catchError((error) {
        emit(ProfileUploadError());
      });
    }).catchError((error) {
      emit(ProfileUploadError());
    });
  }

// uplad cover image
  void UploadCoverImage() {
    emit(updateCoverindecator());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        model.Cover_Image = value;
        FirebaseFirestore.instance
            .collection('User1')
            .doc(model.uId)
            .update(model.toMap())
            .then((value) {
          getUserData();
        }).catchError((error) {
          print(error.toString());
        });
        emit(ProfileUploadSuccessful());
      }).catchError((error) {
        emit(ProfileUploadError());
      });
    }).catchError((error) {
      emit(ProfileUploadError());
    });
  }

  // update user data
  void UpdateUserData({
    required String Name,
    required String Bio,
    required String phone,
  }) {
    emit(updateUserindecator());
    model.name = Name;
    model.Bio = Bio;
    model.phone = phone;
    FirebaseFirestore.instance
        .collection('User1')
        .doc(model.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      print(error.toString());
    });
  }

  //get post image
  File? postImage;
  Future<void> getpostimage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      postImage = File(pickedFile!.path);
      emit(postImageUploadsuccess());
    } else {
      print('No Image Selected');
      emit(postImageUploaderror());
    }
  }

  //remove post image
  void RemovePostImage (){
    postImage=null;
    emit(closepostImage());
  }

  //create post with image
  void CreatePostwithImage({
    required String datetime,
    required String text,
  }) {
    postmodel = Create_Post_Model(
      uId: model.uId,
      datetime: datetime,
      text: text,
      post_Image: '',
      name: model.name,
      profileimage: model.profile_image,
    );
    emit(LoadingCreatepost());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        postmodel.post_Image = value;
        FirebaseFirestore.instance
            .collection('Posts')
            .doc()
            .set(postmodel.toMap())
            .then((value) {
          Createpost(datetime: datetime, text: text);
        }).catchError((error) {
          print(error.toString());
        });
        emit(PostUploadSuccessful());
      }).catchError((error) {
        emit(PostUploadError());
      });
    }).catchError((error) {
      emit(ProfileUploadError());
    });
  }

 // create post
  void Createpost({
    required String text,
    required String datetime,
  }) {
    postmodel = Create_Post_Model(
      uId: model.uId,
      datetime: datetime,
      text: text,
      profileimage:model.profile_image,
      post_Image: postImage==null?"":postImage as String,
      name: model.name,
    );
    emit(LoadingCreatepost());
    FirebaseFirestore.instance
        .collection('Posts')
        .add(postmodel.toMap())
        .then((value) {
          emit(PostUploadSuccessful());
    })
        .catchError((error) {
      print(error.toString());
      emit(PostUploadError());
    });
  }

  // get posts
  List posts = [];

void Getposts(){
  FirebaseFirestore.instance
      .collection('Posts')
      .get()
      .then((value) {
        for (var element in value.docs) {
          posts.add(Create_Post_Model.fromJson(element.data()));
        }

        emit(GetPostsSuccessful());

  }).catchError((error){
    print(error.toString());
        emit(GetPostsError());
  });
}
}
