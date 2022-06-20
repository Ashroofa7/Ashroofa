import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Components/components.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmaincubit.dart';
import 'package:socialapp/social_app/socialmain/socialmaincubit/socialmainstates.dart';

class Edit_Post extends StatelessWidget {
  Edit_Post({Key? key}) : super(key: key);
  var namecontroller = TextEditingController();
  var biocontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialMainCubit, SocialMainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = SocialMainCubit.get(context).model;
        var x = SocialMainCubit.get(context);
        namecontroller.text = c.name;
        biocontroller.text = c.Bio;
        phonecontroller.text = c.phone;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  if( state is updateUserindecator)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTextFiled(
                    controllerr: namecontroller,
                    type: TextInputType.text,
                    valid: (s) {},
                    label: 'Name',
                    fontw: FontWeight.bold,
                    fonts: 20,
                    radius: 15,
                    prefix: Icons.person,
                    ispassword: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTextFiled(
                    controllerr: biocontroller,
                    type: TextInputType.text,
                    valid: (s) {},
                    label: 'Bio',
                    fontw: FontWeight.bold,
                    fonts: 20,
                    radius: 15,
                    prefix: Icons.info_outline,
                    ispassword: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTextFiled(
                    controllerr: phonecontroller,
                    type: TextInputType.text,
                    valid: (s) {},
                    label: 'Phone',
                    fontw: FontWeight.bold,
                    fonts: 20,
                    radius: 15,
                    prefix: Icons.phone,
                    ispassword: false,
                  ),
                  SizedBox(height: 15,),
                  defaultButton(() {
                    x.UpdateUserData(
                      Name: namecontroller.text,
                      Bio: biocontroller.text,
                      phone: phonecontroller.text,
                    );
                  }, 'UPDATE',width: double.infinity )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
