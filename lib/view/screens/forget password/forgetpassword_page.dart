import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late final TextEditingController emailController;

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
    return Scaffold(
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
                  )),
              PublicTextFormField(
                hint: S.of(context).hint_email,
                controller: emailController,
                validator: (e) {},
              ),
              41.ph,
              // button send
              PublicButton(
                  title: S.of(context).send, width: 350.w, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
