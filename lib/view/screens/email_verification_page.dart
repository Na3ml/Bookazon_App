import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


class EmailVerificationPage extends StatelessWidget {
   EmailVerificationPage({super.key});

   OtpFieldController otpFieldController=OtpFieldController();

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
              // title email verification
              PublicText(txt: S.of(context).email_verification,fw: FontWeight.bold,color: Colors.blue,size: 20.sp,),
              SizedBox(height: 10.h,),
              PublicText(txt: S.of(context).describe_email_verification,color: Colors.blue,align: TextAlign.center),
              SizedBox(height: 15.h,),
              //otp text field
              OTPTextField(
                length: 4,
                width: 270.w,

                fieldWidth: 45.w,
                style: TextStyle(
                    fontSize: 20.sp,
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                controller: otpFieldController,
                fieldStyle: FieldStyle.box,
              ),
              SizedBox(height: 20.h,),
              // button send
              PublicButton(title: S.of(context).verify,width: 350.w,onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
