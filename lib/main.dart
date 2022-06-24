// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Components/components.dart';
import 'package:socialapp/social_app/social_login_cubit/cubitt/Cubit.dart';
import 'package:socialapp/social_app/socialmain/social_home.dart';
import 'package:socialapp/social_app/social_login_cubit/social_login_screen.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmaincubit.dart';

import 'BlocObserver/BlocObserver.dart';
import 'Shared/Local/sharedpreferences.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await CasheHelper.init();
      await Firebase.initializeApp();
      uId = CasheHelper.getdata(key: 'uId');
      Widget widget;
      if (uId == null)
        widget = Social_Login_Screen();
      else
        widget = Social_home();
      runApp(
        Myapp(
          widget: widget,
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class Myapp extends StatelessWidget {
  final Widget widget;
  Myapp({
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SocialMainCubit()..getUserData()..Getposts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[250],
            primaryColor: Colors.pinkAccent,
            appBarTheme: AppBarTheme(
              color: Colors.pinkAccent,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.pinkAccent,
              elevation: 5,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[500],
            )),
        darkTheme: ThemeData(
            backgroundColor: Colors.grey[900],
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedItemColor: Colors.grey,
            )),
        themeMode: ThemeMode.light,
        home: widget,
      ),
    );
  }
}
