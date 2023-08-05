import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/screens/login/components/icons_box.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
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
              PublicText(txt:S.of(context).title_login,size: 28.sp,fw: FontWeight.w600,color: AppColors.purple,),
              63.ph,
              //email
              Align(
                alignment: Alignment.centerLeft,
                  child: PublicText(txt: S.of(context).email,color: AppColors.black,fw: FontWeight.w500,)),
               PublicTextFormField(hint: S.of(context).hint_email, controller: emailController, validator: (e){},

              ),
              21.ph,
              //password
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(txt: S.of(context).password,color: AppColors.black,)),
              PublicTextFormField(hint: S.of(context).hint_password, controller: passwordController, validator: (e){},isPassword: true,showSuffixIcon: true),
              //forget password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){}, child:PublicText(txt: S.of(context).forget_password,size: 14.sp,)),
              ),
              63.ph,
              // button login
              PublicButton(title: S.of(context).login,width: 307.w,onPressed: (){}),
              // login with facebook or gmail
              63.ph,
              PublicText(txt: S.of(context).or,color: Colors.grey),
              38.ph,
              SizedBox(
                width: 251.w,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    IconsBox(),
                    IconsBox(),
                    IconsBox(),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              //don't have account signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PublicText(txt: S.of(context).dont_have_account,size: 13.sp,fw: FontWeight.bold,),
                  TextButton(onPressed: (){

                  }, child: PublicText( txt: S.of(context).signup,fw: FontWeight.bold,size: 13.sp,color: AppColors.purple,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
