import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';

class ResetPasswordPage extends StatefulWidget {
   const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController newPasswordController=TextEditingController();

  TextEditingController confirmPasswordController=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key:_formKey ,
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
                29.ph,
                //img
                Image.asset(
                  Assets.imageImgResrt,
                  width: 386.w,
                  height: 356.h,
                ),
                19.ph,
                // title reset password
                PublicText(txt: S.of(context).reset_password,fw: FontWeight.bold,color: AppColors.black,size: 25.sp,),
                28.ph,
                PublicText(txt: S.of(context).describe_reset_password,color: AppColors.grey,fw: FontWeight.w400,align: TextAlign.center),
                42.ph,
                //new password
                Align(
                    alignment: Alignment.centerLeft,
                    child: PublicText(txt: S.of(context).new_password,color: AppColors.black,fw: FontWeight.w500,)),
                PublicTextFormField(hint: S.of(context).hint_new_password,
                  controller: newPasswordController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },

                ),
                22.ph,
                Align(
                    alignment: Alignment.centerLeft,
                    child: PublicText(txt: S.of(context).confirm_password,color: AppColors.black,fw: FontWeight.w500,)),
                PublicTextFormField(hint: S.of(context).hint_new_password,
                  controller: confirmPasswordController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },

                ),
                30.ph,
                // button send
                PublicButton(title: S.of(context).submit,width: 350.w,
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {

                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
