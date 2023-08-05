import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/screens/login/components/icons_box.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

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
              // creat a new account
              PublicText(txt:S.of(context).title_signup,size: 28.sp,fw: FontWeight.w600,color: AppColors.purple,),
              43.ph,
              //username
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(
                    txt: S.of(context).username,
                    color: AppColors.black,fw: FontWeight.w500,
                  )),
              PublicTextFormField(
                hint: S.of(context).hint_username,
                controller: _usernameController,
                validator: (e) {},
              ),
              21.ph,
              //email
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(
                    txt: S.of(context).email,
                    color: AppColors.black,fw: FontWeight.w500,
                  )),
              PublicTextFormField(
                hint: S.of(context).hint_email,
                controller: _emailController,
                validator: (e) {},
              ),
              21.ph,
              //password
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(
                    txt: S.of(context).password,
                    color: AppColors.black,fw: FontWeight.w500,
                  )),
              PublicTextFormField(
                hint: S.of(context).hint_password,
                controller: _passwordController,
                validator: (e) {},
              ),
              21.ph,
              //confirm password
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(
                    txt: S.of(context).confirm_password,
                    color: AppColors.black,fw: FontWeight.w500,
                  )),
              PublicTextFormField(
                hint: S.of(context).hint_password,
                controller: _passwordConfirmController,
                validator: (e) {},
              ),
              88.ph,
              //button signup
              PublicButton(
                  title: S.of(context).signup, width: 350.w, onPressed: () {}),
              // signup with facebook or gmail
              SizedBox(
                height: 15.h,
              ),
              PublicText(txt: S.of(context).or, color: Colors.grey),
              15.ph,
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
              SizedBox(
                height: 10.h,
              ),
              //already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PublicText(
                    txt: S.of(context).already_have_account,
                    size: 13.sp,fw: FontWeight.bold,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: PublicText(
                      txt: S.of(context).login,
                      fw: FontWeight.bold,size: 13.sp,color: AppColors.purple,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
