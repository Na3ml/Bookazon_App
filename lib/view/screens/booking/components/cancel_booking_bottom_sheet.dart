part of '../booking_page.dart';

class CancelBookingBottomSheet extends StatelessWidget {
  const CancelBookingBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 26.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PublicText(
              txt: S.of(context).cancelBooking,
              color: AppColors.red,
              size: 20.sp,
              fw: FontWeight.w600,
            ),
            20.ph,
            const PublicDivider(
              width: double.infinity,
              color: AppColors.grey,
            ),
            10.ph,
            PublicText(
              txt: S.of(context).cancelBookingSubtitle,
              size: 18.sp,
              fw: FontWeight.w600,
              align: TextAlign.center,
            ),
            34.ph,
            PublicButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.cancelBooking);
              },
              title: S.of(context).yesContinue,
            ),
            14.ph,
            PublicOutlineButton(
              onPressed: () => Navigator.pop(context),
              title: S.of(context).cancel,
            ),
          ],
        ),
      ),
    );
  }
}
