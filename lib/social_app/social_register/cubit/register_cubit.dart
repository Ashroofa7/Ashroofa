import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Shared/Local/sharedpreferences.dart';
import 'package:socialapp/models/social_create_users_model.dart';
import 'package:socialapp/social_app/social_register/cubit/register_states.dart';

import '../../../Components/components.dart';

class RegisterSocial extends Cubit<RegisterSocialStates> {
  RegisterSocial() : super(InitialStates());

  static RegisterSocial get(context) => BlocProvider.of(context);

  void UserRegisteration({
    required String email,
    required String user,
    required String password,
    required String phone,

  }) {
    emit(LoadingRegisteSocialState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.uid);
      UserCreation(
        email: email,
        user: user,
        uId: value.user!.uid,
        phone: phone,

      );
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRegisterSocialState(error));
    });
  }

  void UserCreation({
    required String email,
    required String user,
    required String uId,
    required String phone,
  }) {
    Create_User_model model = Create_User_model(
      email: email,
      phone: phone,
      name: user,
      uId: uId,
      Cover_Image: 'https://ik.imagekit.io/ionicfirebaseapp/getflutter/tr:dpr-auto,tr:w-auto/2020/01/GFCards@2x-1.png',
      profile_image:'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png',
      Bio:'Write Your Bio...',

    );

    FirebaseFirestore.instance
        .collection('User1')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SuccessRegisterSocialState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCreateUserState(error.toString()));
    });
  }
  void finishedRegister(){
    emit(FinisheRegister());
  }
}
