import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:const[
          Icon(Icons.share)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PublicText(txt: 'Hurghada',fw: FontWeight.bold,size: 20.sp,),
                // container map
                Container(
                  width: 78.w,
                  height: 37.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.sp),
                    color: AppColors.white,
                    border: Border.all(color: AppColors.orange),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.map,color: AppColors.orange),
                      PublicText(
                        txt: S.of(context).map,
                        size: 18.sp,
                        fw: FontWeight.w400,
                        color:AppColors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.ph,
            // icon favourite
            Row(
              children: [
               const Icon(Icons.favorite,color: Colors.red,),
                 10.pw,
                 PublicText(
                     txt: '2 properties',
                     color: AppColors.black,
                     size: 16.sp,
                     fw: FontWeight.w400,
                 ),
              ],
            ),
            17.ph,
            Row(
              children: [
              const  Icon(Icons.date_range,color: AppColors.orange,),
                10.pw,
                PublicText(
                    txt: 'Aug 19 - Aug 21 (2nights)',
                  size: 16.sp,
                  color: AppColors.orange,
                  fw: FontWeight.w400,
                ),
              ],
            ),
            17.ph,
            Row(
              children: [
                const  Icon(Icons.person,color: AppColors.orange,),
                10.pw,
                PublicText(
                  txt: '1 adult, 1 child',
                  size: 16.sp,
                  color: AppColors.orange,
                  fw: FontWeight.w400,
                ),
              ],
            ),
            45.ph,
            SizedBox(
              height: 630.h,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal:5 ),
                    child: Container(
                      height: 298.h,
                      width: 374.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6.sp),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.5),
                            spreadRadius: 0.6,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(

                        children: [
                          Image.asset(
                            Assets.imageFacebook,
                            width: 374.w,
                            height: 119.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                   const Icon(Icons.star),
                                    PublicText(
                                        txt:S.of(context).hotel,
                                      size: 14.sp,
                                      color: AppColors.black,
                                      fw: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                PublicText(
                                  txt: 'Hotel Gasteresidenz pelikanviertel',
                                  fw: FontWeight.w600,
                                  size: 20.sp,
                                  color: AppColors.purple,
                                ),
                                Row(
                                  children: [
                                    PublicText(
                                      txt: '8.2- Very good (690)',
                                      size: 14.sp,
                                      color: AppColors.black,
                                      fw: FontWeight.w400,
                                    ),
                                    10.pw,
                                   const Icon(Icons.location_on),
                                    PublicText(txt: 'cairo')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          15.ph,
                          Container(
                            height: 69.h,
                            width: 342.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.sp),
                                color: AppColors.orange.withOpacity(0.38)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  PublicText(
                                    txt: 'Hotel site',
                                    size: 14.sp,
                                    fw: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      PublicText(
                                        txt: '260\$',
                                        color: AppColors.orange,
                                        size: 14.sp,
                                        fw: FontWeight.w600,
                                      ),
                                      Container(
                                        height: 24.h,
                                        width: 86.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          borderRadius: BorderRadius.circular(6.sp)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            PublicText(
                                              txt: 'View Deal',
                                              color: AppColors.white,
                                              size: 12.sp,
                                              fw: FontWeight.w600,
                                            ),
                                           Icon(Icons.arrow_forward_ios,size: 12.sp,)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}
