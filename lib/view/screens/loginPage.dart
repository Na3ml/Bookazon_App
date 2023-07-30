import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            PublicText(txt:S.of(context).login,size: 28.sp,fw: FontWeight.bold),
            SizedBox(
              child: PublicTextFormField(hint: S.of(context).email, controller: emailController, validator: (e){},

              ),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              child: PublicTextFormField(hint: S.of(context).password, controller: passwordController, validator: (e){},isPassword: true,showSuffixIcon: true),
            ),
            SizedBox(height: 20.h,),
            PublicButton(title: S.of(context).login,width: 150.w,onPressed: (){})
          ],
        ),
      ),
    );
  }
}
