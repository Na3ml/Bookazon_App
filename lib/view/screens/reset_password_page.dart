import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';

class ResetPasswordPage extends StatelessWidget {
   ResetPasswordPage({super.key});
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 300.h,),
              // title reset password
              PublicText(txt: S.of(context).reset_password,fw: FontWeight.bold,color: Colors.blue,size: 20.sp,),
              SizedBox(height: 10.h,),
              PublicText(txt: S.of(context).describe_reset_password,color: Colors.blue,align: TextAlign.center),
              SizedBox(height: 15.h,),
              //email
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(txt: S.of(context).new_password,color: Colors.blue,)),
              SizedBox(
                width: 350.w,
                child: PublicTextFormField(hint: S.of(context).hint_new_password, controller: newPasswordController, validator: (e){},

                ),
              ),
              SizedBox(height: 20.h,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(txt: S.of(context).confirm_password,color: Colors.blue,)),
              SizedBox(
                width: 350.w,
                child: PublicTextFormField(hint: S.of(context).hint_new_password, controller: confirmPasswordController, validator: (e){},

                ),
              ),
              SizedBox(height: 20.h,),
              // button send
              PublicButton(title: S.of(context).submit,width: 350.w,onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
