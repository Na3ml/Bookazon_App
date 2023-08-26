import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/localization/generated/l10n.dart';
import '../../widgets/public_text.dart';

class HotelPhotosPage extends StatelessWidget {
  const HotelPhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: PublicText(
            txt: S.of(context).hotelPhotos,
            size: 20.sp,
            fw: FontWeight.bold,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
            ),
            itemBuilder: (_,index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(Assets.imageRoom2,fit: BoxFit.fill,),
              );
            },
          ),
        ),
      ),
    );
  }
}
