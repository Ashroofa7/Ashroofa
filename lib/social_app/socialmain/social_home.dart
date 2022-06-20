import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Components/components.dart';
import 'package:socialapp/Shared/Local/sharedpreferences.dart';
import 'package:socialapp/social_app/social_login_cubit/cubitt/Social_States.dart';
import 'package:socialapp/social_app/social_login_cubit/social_login_screen.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmaincubit.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmainstates.dart';

import '../modules/newPost/newPost.dart';

class Social_home extends StatelessWidget {
  const Social_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialMainCubit, SocialMainStates>(
      listener: (context, state) {
        if (state is New_Post)
          Navigateto(context, NewPost());

      },
      builder: (context, state) {
        var c = SocialMainCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text (c.titles[c.currentindex]),
            actions: [
              IconButton(
                onPressed: () {
                  Navigateandfinish(context, Social_Login_Screen());
                  CasheHelper.removeData(key: 'uId');
                  print(uId);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body:c.Screens[c.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            items:  [
              BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat_rounded,),label: 'Chats'),
              BottomNavigationBarItem(icon: Icon(Icons.upload_file,),label: 'Post'),
              BottomNavigationBarItem(icon: Icon(Icons.people,),label: 'Friends'),
              BottomNavigationBarItem(icon: Icon(Icons.settings,),label: 'Settings'),
            ],
            onTap: (int index){
              c.changeIndex(index);
            },
            currentIndex: c.currentindex,
          ),
        );
      },
    );
  }
}
