import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Components/components.dart';
import 'package:socialapp/social_app/modules/home/home.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmaincubit.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmainstates.dart';

class NewPost extends StatelessWidget {
  NewPost({Key? key}) : super(key: key);
  var postcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialMainCubit, SocialMainStates>(
      listener: (context, state) {
        if (state is PostUploadSuccessful) {
          Navigator.pop(context, Home());

          Toasts(
              state: ToastsState.Success, message: 'Post has been published');
          SocialMainCubit.get(context).RemovePostImage();
        }
      },
      builder: (context, state) {
        var c = SocialMainCubit.get(context);
        File? PostImage = c.postImage;

        return Scaffold(
          appBar: defaultAppBar(
            iconLe: Icons.chevron_left,
            text: Text('Create Post'),
            textB: Text(
              'Post',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onpA: () {
              var time = DateTime.now();

              c.postImage == null
                  ? c.Createpost(
                      text: postcontroller.text,
                      datetime: time.toString(),
                    )
                  : c.CreatePostwithImage(
                      datetime: time.toString(),
                      text: postcontroller.text,
                    );
            },
            onpLe: () {
              Navigator.pop(context);
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 530,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          if (state is LoadingCreatepost) LinearProgressIndicator(),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Image(
                                  image: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Mohamed Ashraf',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          //crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Public',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600]),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Icon(
                                              Icons.public,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: postcontroller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'What\'s on your mind...?',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              maxLines: null,
                              scrollPhysics: BouncingScrollPhysics(),
                              textAlignVertical: TextAlignVertical.top,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          if (PostImage != null)
                            Stack(
                              children: [
                                Container(
                                  height: 270,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: FileImage(PostImage) as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      splashRadius: Material.nullSplashRadius1,
                                      onPressed: () {
                                        c.RemovePostImage();
                                      },
                                      icon: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        radius: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    verticalDirection:VerticalDirection.down,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.pinkAccent,
                          child: TextButton(
                            onPressed: () {
                              c.getpostimage();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons
                                          .photo_size_select_actual_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Add Photos',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Container(
                          color: Colors.pinkAccent,
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.tag_faces,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Add Tags',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
