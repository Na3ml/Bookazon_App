import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../resources/constants/app_constants.dart';
import '../../../resources/style/app_colors.dart';
import '../hotel_details/hotel_details_page.dart';
import '../../widgets/public/public_text.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  int starIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: PublicText(
            txt: S.of(context).hotelPhotos,
            size: 25.sp,
            fw: FontWeight.bold,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.stars.length,
                  itemBuilder: (_, index) {
                    return ChoiceChip(
                      label: PublicText(
                        txt: AppConstants.stars[index],
                        fw: FontWeight.w600,
                        size: 13.sp,
                        color: starIndex == index
                            ? AppColors.white
                            : AppColors.purple,
                      ),
                      backgroundColor: AppColors.white,
                      selectedColor: AppColors.purple,
                      selected: starIndex == index,
                      onSelected: (_) {
                        setState(() {
                          starIndex = index;
                        });
                      },
                    );
                  },
                  separatorBuilder: (_, __) => 20.pw,
                ),
              ),
              Row(
                children: [
                  PublicText(
                    txt: S.of(context).reviews,
                    size: 20.sp,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.star,
                    color: AppColors.orange,
                    size: 20.w,
                  ),
                  PublicText(
                    txt: "4.8 (81) reviews",
                    color: AppColors.subTitleGrey,
                    size: 14.sp,
                  ),
                ],
              ),
              15.ph,
              Expanded(
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ReviewCard();
                  },
                  separatorBuilder: (_, __) => 12.ph,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
