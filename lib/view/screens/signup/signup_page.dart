import 'package:bookazon/data/models/requests/auth_requests_model.dart';
import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/screens/login/components/icons_box.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_divider.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:bookazon/view_model/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../resources/router/app_router.dart';
import '../../widgets/public_snack_bar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController _firsttNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;
  late final TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firsttNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _firsttNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (_, current) {
        return (current is RegisterState || current is AuthnErrorState);
      },
      buildWhen: (_, current) {
        return (current is RegisterState || current is AuthnErrorState);
      },
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is AuthnErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is LoginSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.homePage,
              (_) => false,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is! RegisterSuccessState) {
          return ModalProgressHUD(
            inAsyncCall: cubit.spinner,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(),
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
                        // creat a new account
                        PublicText(
                          txt: S.of(context).title_signup,
                          size: 28.sp,
                          fw: FontWeight.w600,
                          color: AppColors.purple,
                        ),
                        43.ph,
                        //username
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).username,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: PublicTextFormField(
                                hint: S.of(context).firstName,
                                controller: _firsttNameController,
                                keyboardtype: TextInputType.name,
                                validator: (name) {
                                  if (name == null || name.length < 3) {
                                    return S.of(context).message_null_username;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            10.pw,
                            Expanded(
                              child: PublicTextFormField(
                                hint: S.of(context).lastName,
                                controller: _lastNameController,
                                keyboardtype: TextInputType.name,
                                validator: (name) {
                                  if (name == null || name.length < 3) {
                                    return S.of(context).message_null_username;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        21.ph,
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
                          keyboardtype: TextInputType.emailAddress,
                          controller: _emailController,
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
                            fw: FontWeight.w500,
                          ),
                        ),
                        PublicTextFormField(
                          hint: S.of(context).hint_password,
                          controller: _passwordController,
                          keyboardtype: TextInputType.visiblePassword,
                          isPassword: true,
                          showSuffixIcon: true,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return S.of(context).message_null_password;
                            } else {
                              if (password.isPassValid()) {
                                return null;
                              } else {
                                return S.of(context).title_error_password;
                              }
                            }
                          },
                        ),
                        21.ph,
                        //confirm password
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).confirm_password,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                        ),
                        PublicTextFormField(
                          hint: S.of(context).hint_password,
                          controller: _passwordConfirmController,
                          keyboardtype: TextInputType.visiblePassword,
                          isPassword: true,
                          showSuffixIcon: true,
                          validator: (confirmPassword) {
                            if (confirmPassword == null ||
                                confirmPassword.isEmpty) {
                              return S.of(context).message_null_password;
                            } else if (confirmPassword !=
                                _passwordController.text) {
                              return S.of(context).title_error_confirmPassword;
                            } else {
                              return null;
                            }
                          },
                        ),
                        21.ph,
                        // phone 
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PublicText(
                            txt: S.of(context).phoneNumber,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                        ),
                        PublicTextFormField(
                          hint: S.of(context).phoneNumber,
                          controller: _phoneController,
                          keyboardtype: TextInputType.number,
                          validator: (phone) {
                            if (phone == null ||
                                phone.isEmpty) {
                              return S.of(context).enterPhoneNumber;
                            } else if (phone.isMobileNumberValid()) {
                              return S.of(context).phoneNumberInvalid;
                            } else {
                              return null;
                            }
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BlocBuilder<AuthCubit, AuthState>(
                              buildWhen: (_, current) =>
                                  current is ChangeAcceptTermsState,
                              builder: (context, state) {
                                return Checkbox(
                                  value: cubit.acceptTerms,
                                  onChanged: (_) => cubit.changeAcceptTerms(),
                                );
                              },
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.privacyPolicy);
                              },
                              child: PublicText(
                                txt: S.of(context).privacy_policy,
                                align: TextAlign.center,
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: AppColors.orange,
                                under: true,
                              ),
                            )
                          ],
                        ),
                        31.ph,
                        //button signup
                        PublicButton(
                          title: S.of(context).signup,
                          width: 350.w,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final request = RegisterRequest(
                                firstName: _firsttNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                phone: "",
                              );
                              // To dismiss keyboard
                              FocusScope.of(context).unfocus();
                              cubit.register(request);
                            }
                          },
                        ),
                        // signup with facebook or gmail
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const PublicDivider(),
                            PublicText(
                                txt: S.of(context).or, color: Colors.grey),
                            const PublicDivider(),
                          ],
                        ),
                        15.ph,
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
                        //already have account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PublicText(
                              txt: S.of(context).already_have_account,
                              size: 13.sp,
                              fw: FontWeight.bold,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: PublicText(
                                txt: S.of(context).login,
                                fw: FontWeight.bold,
                                size: 13.sp,
                                color: AppColors.orange,
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
