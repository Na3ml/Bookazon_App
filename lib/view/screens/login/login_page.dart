import 'package:bookazon/data/models/auth_requests_model.dart';
import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/screens/login/components/icons_box.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_divider.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:bookazon/view_model/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import '../../widgets/public_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (_, current) {
        return (current is LoginState || current is AuthnErrorState);
      },
      buildWhen: (_, current) {
        return (current is LoginState || current is AuthnErrorState);
      },
      listener: (context, state) {
        if (state is LoginLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is AuthnErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is LoginSuccessState) {
            Navigator.pushReplacementNamed(context, AppRoutes.homePage);
          }
        }
      },
      builder: (context, state) {
        if (state is! LoginSuccessState) {
          return 
          ModalProgressHUD(
            inAsyncCall: cubit.spinner,
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        61.ph,
                        // logo
                        Image.asset(
                          Assets.imageLogo,
                          width: 174.w,
                          height: 53.h,
                        ),
                        49.ph,
                        // Login to your account
                        PublicText(
                          txt: S.of(context).title_login,
                          size: 28.sp,
                          fw: FontWeight.w600,
                          color: AppColors.purple,
                        ),
                        63.ph,
                        //email
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).email,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                        ),
                        PublicTextFormField(
                          hint: S.of(context).hint_email,
                          controller: emailController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return S.of(context).message_null_email;
                            } else if (email.isEmailValid()) {
                              return null;
                            } else {
                              return S.of(context).title_error_email;
                            }
                          },
                        ),
                        21.ph,
                        //password
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).password,
                            color: AppColors.black,
                          ),
                        ),
                        PublicTextFormField(
                          hint: S.of(context).hint_password,
                          controller: passwordController,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return S.of(context).message_null_password;
                            } else if (password.isPassValid()) {
                              return null;
                            } else {
                              return S.of(context).title_error_password;
                            }
                          },
                          isPassword: true,
                          showSuffixIcon: true,
                        ),
                        //forget password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) => value,
                                ),
                                PublicText(
                                    txt: S.of(context).remember_me,
                                    size: 15.sp,
                                    fw: FontWeight.w500),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.forgotPassword,
                                  );
                                },
                                child: PublicText(
                                  txt: S.of(context).forget_password,
                                  size: 14.sp,
                                )),
                          ],
                        ),
                        63.ph,
                        // button login
                        PublicButton(
                          title: S.of(context).login,
                          width: 307.w,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final request = LoginRequest(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              // To dismiss keyboard
                              FocusScope.of(context).unfocus();
                              cubit.login(request);
                            }
                          },
                        ),
                        // login with facebook or gmail
                        63.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const PublicDivider(),
                            PublicText(
                                txt: S.of(context).or, color: Colors.grey),
                            const PublicDivider(),
                          ],
                        ),
                        38.ph,
                        SizedBox(
                          width: 251.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  // TODO: 'data, logic' login with facebook
                                },
                                child: IconsBox(
                                  imge: Image.asset(
                                    Assets.imageFacebook,
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // TODO: 'data, logic' login with google
                                },
                                child: IconsBox(
                                  imge: Image.asset(
                                    Assets.imageGoogle,
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // TODO: 'data, logic' login with apple
                                },
                                child: IconsBox(
                                  imge: Image.asset(
                                    Assets.imageApple,
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //don't have account signup
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PublicText(
                              txt: S.of(context).dont_have_account,
                              size: 13.sp,
                              fw: FontWeight.bold,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.signUp);
                              },
                              child: PublicText(
                                txt: S.of(context).signup,
                                fw: FontWeight.bold,
                                size: 13.sp,
                                color: AppColors.purple,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
