import 'package:bookazon/data/models/auth_requests_model.dart';
import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view_model/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../resources/router/app_router.dart';
import '../../widgets/public_snack_bar.dart';

// ignore: must_be_immutable
class EmailVerificationPage extends StatelessWidget {
  final String email;
  const EmailVerificationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (_, current) {
        return (current is VerifyEmailState || current is AuthnErrorState);
      },
      buildWhen: (_, current) {
        return (current is VerifyEmailState || current is AuthnErrorState);
      },
      listener: (context, state) {
        if (state is VerifyEmailLoadingState) {
          cubit.changeSnipper();
        } else {
          if (cubit.spinner) {
            cubit.changeSnipper();
          }
          if (state is AuthnErrorState) {
            MySnackBar.error(
                message: state.error, color: Colors.red, context: context);
          } else if (state is VerifyEmailSuccessState) {
            Navigator.pushNamed(
              context,
              AppRoutes.resetPassword,
              arguments: email,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is! VerifyEmailSuccessState) {
          return ModalProgressHUD(
            inAsyncCall: cubit.spinner,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                        Assets.imageImgVerification,
                        width: 386.w,
                        height: 356.h,
                      ),
                      19.ph,
                      // title email verification
                      PublicText(
                        txt: S.of(context).email_verification,
                        fw: FontWeight.bold,
                        color: AppColors.black,
                        size: 25.sp,
                      ),
                      29.ph,
                      PublicText(
                          txt: S.of(context).describe_email_verification,
                          color: AppColors.grey,
                          fw: FontWeight.w400,
                          align: TextAlign.center),
                      46.ph,
                      //otp text field
                      OTPTextField(
                        length: 4,
                        width: 364.w,
                        fieldWidth: 82.w,
                        style: TextStyle(
                            fontSize: 35.sp, fontWeight: FontWeight.w400),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        onChanged: (otp) {
                          cubit.otp = otp;
                        },
                      ),
                      44.ph,
                      // button send
                      PublicButton(
                        title: S.of(context).verify,
                        width: 350.w,
                        onPressed: () {
                          final request = VerifyEmailRequest(
                            email: email,
                            otp: cubit.otp,
                          );
                          cubit.verifyEmail(request);
                        },
                      ),
                    ],
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
