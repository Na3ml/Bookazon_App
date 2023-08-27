import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public/public_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/localization/generated/l10n.dart';
import '../../widgets/public/public_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          children: [
            303.ph,
            Image.asset(
              Assets.imageLogo,
              width: 297.w,
              height: 88.h,
            ),
            const Spacer(),
            PublicButton(
              title: S.of(context).login,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
            ),
            14.ph,
            PublicOutlineButton(
              title: S.of(context).continueWithoutSignUp,
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.layouts),
            ),
            30.ph,
          ],
        ),
      ),
    );
  }
}
