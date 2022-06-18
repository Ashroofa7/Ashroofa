import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Components/components.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmaincubit.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmainstates.dart';

class Edit_Post extends StatelessWidget {
   Edit_Post({Key? key}) : super(key: key);

  var namecontroller = TextEditingController();
  var biocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialMainCubit, SocialMainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = SocialMainCubit.get(context).model;
        var x = SocialMainCubit.get(context);

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
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
                              image: NetworkImage(
                                '${c.Cover_Image}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              splashRadius: Material.nullSplashRadius1,
                              onPressed: () {
                                x.coverImage;
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
                              child: Image(
                                image: NetworkImage(
                                  '${c.profile_image}',
                                ),
                              ),
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTextFiled(
                    controllerr: namecontroller,
                    type: TextInputType.text,

                    valid: (s){},
                    label: 'Name',
                    fontw: FontWeight.bold,
                    fonts: 20,
                    radius: 15,
                    prefix: Icons.person,
                  ),
                  SizedBox(height: 10,),
                  defaultTextFiled(
                    controllerr: biocontroller,
                    type: TextInputType.text,
                    valid: (s){},
                    label: 'Bio',
                    fontw: FontWeight.bold,
                    fonts: 20,
                    radius: 15,
                    prefix: Icons.person,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
