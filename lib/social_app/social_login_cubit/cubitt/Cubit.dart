import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Shared/Local/sharedpreferences.dart';

import '../../../Components/components.dart';
import 'Social_States.dart';

class SocialCubit extends Cubit<Social_states> {
  SocialCubit() : super(InitialStates());

  static SocialCubit get(context) => BlocProvider.of(context);

  bool ispassword = true;

  IconData suffix = Icons.visibility;

  void changepassword() {
    ispassword = !ispassword;
    suffix = ispassword ? Icons.visibility : Icons.visibility_off;
    emit(Changepassword());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginSocial());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
          print(value.user!.uid);
          emit(SuccesLoginSocial(value.user!.uid));

    }).catchError((error) {
      print(error.toString());
      emit(ErrorLoginSocial(error.toString()));
    });
  }

}
