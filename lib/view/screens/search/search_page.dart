import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view/widgets/public_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';

class SearchPage extends StatelessWidget {
    SearchPage({super.key});
    TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.h,
              width: 394.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                  color: AppColors.grey.withOpacity(0.4),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  ),
                ]
              ),
              child: PublicTextFormField(
                  hint: S.of(context).search,
                  controller:emailController,
                  validator: null,
                borderRadius: 5.sp,
                showprefixIcon: true,
                prefixIcon: Icons.arrow_back_ios,
                ontapPrefixIcon: () {

                },
              ),
            ),

            Container(
              height:60.h,
              width: 428.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.4),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30.h,
                    width: 76.w,
                    child: Row(
                      children: [
                      const  Icon(Icons.sort),
                        PublicText(
                          txt: S.of(context).sort,
                          size: 20.sp,
                          fw: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    color: AppColors.grey,
                    height: 46.h,
                    width: 1.w,
                  ),

                  SizedBox(
                    height: 30.h,
                    width: 76.w,
                    child: Row(
                      children: [
                        const  Icon(Icons.filter_list_rounded),
                        PublicText(
                          txt: S.of(context).filter,
                          size: 20.sp,
                          fw: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            20.ph,

            SizedBox(
              height:700.h ,
              width: 428.w,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 17),
                  child: Container(
                    height: 128.h,
                    width: 394.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.sp),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withOpacity(0.4),
                          spreadRadius: 0.5,
                          blurRadius: 2,
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height:110.h ,
                          width: 139.w,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20.sp)
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PublicText(
                                  txt: 'Sareena Hotel',
                                  size: 18.sp,
                                  fw: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                                62.pw,
                                PublicText(
                                  txt: '50\$',
                                  color: AppColors.purple,
                                  size: 14.sp,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                               const Icon(Icons.location_on),
                                PublicText(
                                  txt: 'Cairo, Egypt',
                                  size: 14.sp,
                                  fw: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                              ],
                            ),
                            PublicText(
                              txt: '4.9 (4.977 reviews)',
                              size: 14.sp,
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
          ],
        ),
      ),
    );
  }
}
