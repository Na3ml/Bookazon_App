import 'package:bookazon/data/models/requests/auth_requests_model.dart';
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

class ResetPasswordPage extends StatefulWidget {
  final String email;
  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (_, current) {
        return (current is ResetPasswordState || current is AuthnErrorState);
      },
      buildWhen: (_, current) {
        return (current is ResetPasswordState || current is AuthnErrorState);
      },
      listener: (context, state) {
        if (state is ResetPasswordLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is AuthnErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is ResetPasswordSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (_) => false,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is! ResetPasswordSuccessState) {
          return ModalProgressHUD(
              inAsyncCall: cubit.spinner,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 20.h,
                      ),
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
                          29.ph,
                          //img
                          Image.asset(
                            Assets.imageImgResrt,
                            width: 386.w,
                            height: 356.h,
                          ),
                          19.ph,
                          // title reset password
                          PublicText(
                            txt: S.of(context).reset_password,
                            fw: FontWeight.bold,
                            color: AppColors.black,
                            size: 25.sp,
                          ),
                          28.ph,
                          PublicText(
                              txt: S.of(context).describe_reset_password,
                              color: AppColors.grey,
                              fw: FontWeight.w400,
                              align: TextAlign.center),
                          42.ph,
                          //new password
                          Align(
                              alignment: Alignment.centerLeft,
                              child: PublicText(
                                txt: S.of(context).new_password,
                                color: AppColors.black,
                                fw: FontWeight.w500,
                              )),
                          PublicTextFormField(
                            hint: S.of(context).hint_new_password,
                            controller: newPasswordController,
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: PublicText(
                                        txt: S
                                            .of(context)
                                            .message_error_password,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                  return S.of(context).title_error_password;
                                }
                              }
                            },
                          ),
                          22.ph,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: PublicText(
                              txt: S.of(context).confirm_password,
                              color: AppColors.black,
                              fw: FontWeight.w500,
                            ),
                          ),
                          PublicTextFormField(
                            hint: S.of(context).hint_new_password,
                            controller: confirmPasswordController,
                            keyboardtype: TextInputType.visiblePassword,
                            isPassword: true,
                            showSuffixIcon: true,
                            validator: (confirmPassword) {
                              if (confirmPassword == null ||
                                  confirmPassword.isEmpty) {
                                return S.of(context).message_null_password;
                              } else if (confirmPassword !=
                                  newPasswordController.text) {
                                return S
                                    .of(context)
                                    .title_error_confirmPassword;
                              } else {
                                return null;
                              }
                            },
                          ),
                          30.ph,
                          // button send
                          PublicButton(
                            title: S.of(context).submit,
                            width: 350.w,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final request = ResetPasswordRequest(
                                  email: widget.email,
                                  password: newPasswordController.text,
                                  token: "",
                                );
                                // To dismiss keyboard
                                FocusScope.of(context).unfocus();
                                cubit.resetPassword(request);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
