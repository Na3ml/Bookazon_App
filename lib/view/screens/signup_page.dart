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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 155.h,
              ),
              //username
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(
                    txt: S.of(context).username,
                    color: Colors.blue,
                  )),
              SizedBox(
                width: 350.w,
                child: PublicTextFormField(
                  hint: S.of(context).hint_username,
                  controller: _usernameController,
                  validator: (e) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //email
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(
                    txt: S.of(context).email,
                    color: Colors.blue,
                  )),
              SizedBox(
                width: 350.w,
                child: PublicTextFormField(
                  hint: S.of(context).hint_email,
                  controller: _emailController,
                  validator: (e) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //password
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(
                    txt: S.of(context).password,
                    color: Colors.blue,
                  )),
              SizedBox(
                width: 350.w,
                child: PublicTextFormField(
                  hint: S.of(context).hint_password,
                  controller: _passwordController,
                  validator: (e) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //confirm password
              Align(
                  alignment: Alignment.centerLeft,
                  child: PublicText(
                    txt: S.of(context).confirm_password,
                    color: Colors.blue,
                  )),
              SizedBox(
                width: 350.w,
                child: PublicTextFormField(
                  hint: S.of(context).hint_password,
                  controller: _passwordConfirmController,
                  validator: (e) {},
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              //button signup
              PublicButton(
                  title: S.of(context).signup, width: 350.w, onPressed: () {}),
              // signup with facebook or gmail
              SizedBox(
                height: 15.h,
              ),
              PublicText(txt: S.of(context).or, color: Colors.grey),
              SizedBox(
                height: 15.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  Icon(Icons.mail),
                  Icon(Icons.apple),
                ],
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
                    size: 13.sp,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: PublicText(
                      txt: S.of(context).login,
                      size: 14.sp,
                      color: Colors.blue,
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
