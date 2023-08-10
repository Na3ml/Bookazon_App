import 'package:bookazon/resources/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsBox extends StatelessWidget {
  final  Image? imge;
  const IconsBox({
    this.imge
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57.h,
      width: 64.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.sp),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            spreadRadius: 0.6,
            blurRadius: 4,

          )
        ]
      ),
      child: Center(child: imge),
    );
  }
}
