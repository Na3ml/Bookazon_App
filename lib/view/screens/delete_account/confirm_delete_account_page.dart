
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDeleteAccount extends StatefulWidget {
  const ConfirmDeleteAccount({super.key});

  @override
  State<ConfirmDeleteAccount> createState() => _ConfirmDeleteAccountState();
}

class _ConfirmDeleteAccountState extends State<ConfirmDeleteAccount> {
  late final TextEditingController _explanationController;

  @override
  void initState(){
    super.initState();
    _explanationController=TextEditingController();
  }
  @override
  void dispose(){
    _explanationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PublicText(txt: S.of(context).title_delete_account,size: 20.sp,fw: FontWeight.w400),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:25),
          child: Column(
            children: [
              55.ph,
              SizedBox(
                  height: 150.h,
                  child: PublicText(txt: S.of(context).can_you_share,size: 18.sp,fw: FontWeight.w500,max: 7,)),
              21.ph,
              PublicTextFormField(hint: S.of(context).your_explanation,
                  controller: _explanationController,
                  validator: null,
                  maxLines: 13,

              ),
              86.ph,
              PublicButton(
                  title: S.of(context).confirm_Deletion,
                  onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
