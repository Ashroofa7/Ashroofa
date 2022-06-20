import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Components/components.dart';
import 'package:socialapp/social_app/modules/editPost/editProfile.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmaincubit.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmainstates.dart';

class Setti extends StatelessWidget {
  const Setti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialMainCubit, SocialMainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = SocialMainCubit.get(context).model;
        var x = SocialMainCubit.get(context);
        File? profile = x.profileImage;
        File? cover = x.coverImage;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is updateProfileindecator) LinearProgressIndicator(),
                if (state is updateCoverindecator) LinearProgressIndicator(),
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              5,
                            ),
                            topLeft: Radius.circular(
                              5,
                            ),
                          ),
                          image: DecorationImage(
                            image: cover == null
                                ? NetworkImage(
                                    '${c.Cover_Image}',
                                  )
                                : FileImage(cover) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            splashRadius: Material.nullSplashRadius1,
                            onPressed: () {
                              x.getcoverimage();
                            },
                            icon: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: Icon(Icons.camera_alt),
                              radius: 20,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 63,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: profile == null
                                ? NetworkImage(
                                    '${c.profile_image}',
                                  )
                                : FileImage(profile) as ImageProvider,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 92.0),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: IconButton(
                            splashRadius: Material.nullSplashRadius1,
                            onPressed: () {
                              x.getprofileimage();
                            },
                            icon: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: Icon(Icons.camera_alt),
                              radius: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                if (state is Changeprofilesuccess)
                  defaultButton(() {
                    x.UploadProfileImage();
                  }, 'Update Profile')
                else if (state is Changecoversuccess)
                  defaultButton(
                    () {
                      x.UploadCoverImage();
                    },
                    'Update Cover',
                  ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${c.name}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${c.Bio}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'Post',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'Post',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'Post',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'Post',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Add photos'),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigateto(context, Edit_Post());
                      },
                      child: Icon(Icons.edit_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
//01005285320
