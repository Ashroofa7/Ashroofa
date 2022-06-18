import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Shared/Local/sharedpreferences.dart';
import 'package:socialapp/social_app/socialmain/social_home.dart';

import '../../Components/components.dart';

import '../social_register/social_register_screen.dart';
import 'cubitt/Cubit.dart';
import 'cubitt/Social_States.dart';

class Social_Login_Screen extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => SocialCubit(),
        child: BlocProvider(
          create: (BuildContext context) => SocialCubit(),
          child: BlocConsumer<SocialCubit, Social_states>(
            listener: (context, state) {
              if (state is ErrorLoginSocial) {
                Toasts(
                  state: ToastsState.Error,
                  message: state.error,
                );
              }
              if (state is SuccesLoginSocial) {
                CasheHelper.savedata(key: 'uId', value: state.Uid);

                print(uId);
                print(state.Uid);
                Navigateandfinish(context, Social_home());
              }
            },
            builder: (context, state) {
              var c = SocialCubit.get(context);
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 75,
                        ),
                        defaultTextFiled(
                            controllerr: email,
                            ispassword: false,
                            type: TextInputType.emailAddress,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return 'Password Must Not Be Empty';
                              }
                            },
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefix: Icons.email,
                            label: 'E-mail',
                            fontw: FontWeight.bold,
                            fonts: 20),
                        const SizedBox(
                          height: 50,
                        ),
                        defaultTextFiled(
                            controllerr: password,
                            type: TextInputType.text,
                            prefix: Icons.lock,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return 'Password Must Not Be Empty';
                              }
                            },
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffix: c.suffix,
                            suffixpresed: () {
                              c.changepassword();
                            },
                            label: 'Password',
                            ispassword: c.ispassword,
                            fontw: FontWeight.bold,
                            fonts: 20),
                        const SizedBox(
                          height: 50,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoadingLoginSocial,
                          builder: (context) => defaultwidthButton(() {
                            SocialCubit.get(context).userLogin(
                                email: email.text, password: password.text);
                          }, 'Login'),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                child: Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigateto(context, SocialRegister());
                                  },
                                  child: const Text(
                                    'Register Now',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
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
      ),
    );
  }
}
