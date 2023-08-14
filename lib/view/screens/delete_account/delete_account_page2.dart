
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDeleteAccount extends StatelessWidget {
  const ConfirmDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PublicText(txt: S.of(context).title_delete_account,size: 20.sp,fw: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:25),
        child: Column(
          children: [
            55.ph,
            PublicText(txt: S.of(context).can_you_share,size: 20.sp,fw: FontWeight.w600,),
            41.ph,

            263.ph,
            PublicButton(
                title: S.of(context).delete,
                onPressed: (){})
          ],
        ),
      ),
    );
  }
}
