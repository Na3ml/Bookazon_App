part of '../hotel_details_page.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0.0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.w,
                backgroundImage: const AssetImage(Assets.imageProfile,),
              ),
              10.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PublicText(
                    txt: "Jami Wilson",
                    size: 16.h,
                    fw: FontWeight.w500,
                  ),
                  2.ph,
                  PublicText(
                    txt: "Dec 10, 2023",
                    size: 12.h,
                    color: AppColors.subTitleGrey,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.white,
                      size: 18.w,
                    ),
                    2.pw,
                    PublicText(
                      txt: "4",
                      size: 14.h,
                      fw: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          10.ph,
          PublicText(
            txt:
                "Very nice and comfortable hotel, thank you for accompanying my vacation!",
            size: 14.sp,
          ),
        ],
      ),
    );
  }
}