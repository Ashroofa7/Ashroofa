import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/social_app/social_login_cubit/social_login_screen.dart';
import 'package:socialapp/social_app/socialmain/social_home.dart';

import '../../Components/components.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_states.dart';

class SocialRegister extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var username = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => RegisterSocial(),
        child: BlocConsumer<RegisterSocial, RegisterSocialStates>(
          listener: (context, state) {
            if (state is SuccessRegisterSocialState) {
              Navigateandfinish(context, Social_Login_Screen());
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defaultTextFiled(
                        controllerr: email,
                        prefix: Icons.email,
                        ispassword: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        type: TextInputType.emailAddress,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'value mustmet be empty';
                          }
                          return null;
                        },
                        label: 'E-mail',
                        fontw: FontWeight.bold,
                        fonts: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextFiled(
                        controllerr: password,
                        prefix: Icons.lock,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        type: TextInputType.text,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'value mustmet be empty';
                          }
                          return null;
                        },
                        label: 'Password',
                        fontw: FontWeight.bold,
                        fonts: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextFiled(
                        controllerr: phone,
                        ispassword: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        type: TextInputType.phone,
                        prefix: Icons.phone,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'value mustmet be empty';
                          }
                          return null;
                        },
                        label: 'Phone',
                        fontw: FontWeight.bold,
                        fonts: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextFiled(
                        controllerr: username,
                        prefix: Icons.person,
                        ispassword: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        type: TextInputType.name,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'value mustmet be empty';
                          }
                        },
                        label: 'User Name',
                        fontw: FontWeight.bold,
                        fonts: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoadingRegisteSocialState,
                        builder: (context) => defaultwidthButton(() {
                          if (formkey.currentState!.validate()) {
                            RegisterSocial.get(context).UserRegisteration(
                              email: email.text,
                              user: username.text,
                              password: password.text,
                              phone: phone.text,
                            );
                           // RegisterSocial.get(context).finishedRegister();

                          };
                        }, 'Register'),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
