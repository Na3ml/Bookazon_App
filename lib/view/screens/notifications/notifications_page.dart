import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:flutter/material.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notificaiton),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 24),
            child: Container(
              height:86.h ,
              width: 394.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.5),
                    spreadRadius: 0.6,
                    blurRadius: 4,
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    Assets.imageFacebook,
                    width: 40.w,
                    height: 40.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(

                        children: [
                          PublicText(
                            txt: 'Payment Successful!',
                            size: 20.sp,
                            fw: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          40.pw,
                          PublicText(
                            txt: '20/8/2023',
                            size: 14.sp,
                            fw: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                      PublicText(
                        txt: 'Lorem ipsum dolor sit amet, consectetu',
                        size: 16.sp,
                        fw: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
