part of '../booking_page.dart';

class FinalCard extends StatelessWidget {
  final bool isCompleted;
  const FinalCard({super.key, required this.isCompleted});

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
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  Assets.imageHotel1,
                  fit: BoxFit.fill,
                  width: 140.w,
                  height: 110.h,
                ),
              ),
              20.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PublicText(
                    txt: "Sareana Hotel",
                    fw: FontWeight.bold,
                    size: 20.sp,
                  ),
                  10.ph,
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.locationDot,
                        color: AppColors.purple,
                        size: 20.w,
                      ),
                      10.pw,
                      PublicText(
                        txt: "Egypt - Cairo",
                        size: 15.sp,
                        color: AppColors.subTitleGrey,
                      ),
                    ],
                  ),
                  20.ph,
                  Container(
                    height: 22.h,
                    width: 70.w,
                    color: isCompleted
                        ? AppColors.purple.withOpacity(0.2)
                        : AppColors.red.withOpacity(0.2),
                    child: Center(
                      child: PublicText(
                        txt: isCompleted
                            ? S.of(context).completed
                            : S.of(context).canceled,
                        color: isCompleted ? AppColors.purple : AppColors.red,
                        size: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          20.ph,
          PublicDivider(
            color: AppColors.grey,
            width: 350.w,
          ),
          20.ph,
          Container(
            height: 36.h,
            width: 360.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: isCompleted
                  ? AppColors.purple.withOpacity(0.2)
                  : AppColors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  isCompleted ? Icons.done : Icons.error,
                  color: isCompleted ? AppColors.purple : AppColors.red,
                  size: 15.sp,
                ),
                10.pw,
                PublicText(
                  txt: isCompleted
                      ? S.of(context).completedBookingTitle
                      : S.of(context).canceledBookingTitle,
                  color: isCompleted ? AppColors.purple : AppColors.red,
                  size: 15.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
