import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_button.dart';
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

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late final TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (_, current) {
        return (current is ForgotPasswordState || current is AuthnErrorState);
      },
      buildWhen: (_, current) {
        return (current is ForgotPasswordState || current is AuthnErrorState);
      },
      listener: (context, state) {
        if (state is ForgotPasswordLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is AuthnErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is ForgotPasswordSuccessState) {
            Navigator.pushNamed(context, AppRoutes.emailVerify,
                arguments: emailController.text);
          }
        }
      },
      builder: (context, state) {
        if (state is! ForgotPasswordSuccessState) {
          return ModalProgressHUD(
            inAsyncCall: cubit.spinner,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //logo
                        61.ph,

                        Image.asset(
                          Assets.imageLogo,
                          width: 174.w,
                          height: 53.h,
                        ),
                        54.ph,
                        //img
                        Image.asset(
                          Assets.imageImgForgetpassword,
                          width: 386.w,
                          height: 356.h,
                        ),
                        // title forget password
                        19.ph,
                        PublicText(
                          txt: S.of(context).forget_password,
                          fw: FontWeight.bold,
                          color: AppColors.black,
                          size: 25.sp,
                        ),
                        29.ph,
                        PublicText(
                            txt: S.of(context).describe_forget_password,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                            align: TextAlign.center),
                        41.ph,
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
                            } else {
                              if (email.isEmailValid()) {
                                return null;
                              } else {
                                return S.of(context).title_error_email;
                              }
                            }
                          },
                        ),
                        41.ph,
                        // button send
                        PublicButton(
                          title: S.of(context).send,
                          width: 350.w,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // To dismiss keyboard
                              FocusScope.of(context).unfocus();
                              cubit.forgotPassword(emailController.text);
                            }
                          },
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
