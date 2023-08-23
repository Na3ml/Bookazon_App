import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_switch_list_tile.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/localization/generated/l10n.dart';

class SecuritySettingsPage extends StatelessWidget {
  const SecuritySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: PublicText(
            txt: S.of(context).security,
            fw: FontWeight.bold,
            size: 25.sp,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            children: [
              PublicSwitchListTile(
                title: S.of(context).faceId,
                swithcer: Switchers.faceId,
              ),
              PublicSwitchListTile(
                title: S.of(context).rememberMe,
                swithcer: Switchers.rememberMe,
              ),
              PublicSwitchListTile(
                title: S.of(context).touchId,
                swithcer: Switchers.touchId,
              ),
              ListTile(
                onTap: () {},
                title: PublicText(txt: S.of(context).googleAuthenticator),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              20.ph,
              PublicButton(
                title: S.of(context).changePassword,
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.changePassword,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
