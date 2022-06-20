import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/Components/components.dart';
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

  void getUserData() {
    emit(MainGetDataLoading());

    FirebaseFirestore.instance.collection('User1').doc(uId).get().then((value) {
      model = Create_User_model.fromJson(value.data());
      print(model.profile_image);
      emit(MainGetDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(MainGetDataError(error));
    });
  }

  int currentindex = 0;

  List<String> titles = [
    'News Feed',
    'Chats',
    'New Post',
    'Friends',
    'Settings',
  ];
  List<Widget> Screens = [
    Home(),
    Chat(),
    NewPost(),
    Friends(),
    Setti(),
  ];

  void changeIndex(int index) {
    if (index == 2)
      emit(New_Post());
    else
      currentindex = index;
    print(index);
    emit(ChangeBottomNav());
  }

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
}
