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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 155.h,),
              // Login to your account
              Align(
                alignment: Alignment.centerLeft,
                  child: PublicText(txt:S.of(context).title_login,size: 18.sp,fw: FontWeight.bold,color: Colors.blue,)),
              SizedBox(height: 40.h,),
              //email
              Align(
                alignment: Alignment.centerLeft,
                  child: PublicText(txt: S.of(context).email,color: Colors.blue,)),
              SizedBox(
                width: 350.w,
                child: PublicTextFormField(hint: S.of(context).hint_email, controller: emailController, validator: (e){},

                ),
              ),
              SizedBox(height: 20.h,),
              //password
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(txt: S.of(context).password,color: Colors.blue,)),
              SizedBox(
                width: 350.w,
                child: PublicTextFormField(hint: S.of(context).hint_password, controller: passwordController, validator: (e){},isPassword: true,showSuffixIcon: true),
              ),
              //forget password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){}, child:PublicText(txt: S.of(context).forget_password,size: 14.sp,)),
              ),
              SizedBox(height: 20.h,),
              // button login
              PublicButton(title: S.of(context).login,width: 350.w,onPressed: (){}),
              // login with facebook or gmail
              SizedBox(height: 15.h,),
              PublicText(txt: S.of(context).or,color: Colors.grey),
              SizedBox(height: 15.h,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  Icon(Icons.mail),
                  Icon(Icons.apple),
                ],
              ),
              SizedBox(height: 10.h,),
              //don't have account signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PublicText(txt: S.of(context).dont_have_account,size: 13.sp,),
                  TextButton(onPressed: (){}, child: PublicText( txt: S.of(context).signup,size: 14.sp,color: Colors.blue,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
