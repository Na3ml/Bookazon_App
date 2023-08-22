part of '../booking_page.dart';

class OngoingCard extends StatelessWidget {
  const OngoingCard({
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
                    width: 64.w,
                    color: AppColors.purple.withOpacity(0.2),
                    child: Center(
                      child: PublicText(
                        txt: S.of(context).paid,
                        color: AppColors.purple,
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
          Row(
            children: [
              Expanded(
                child: PublicButton(
                  title: S.of(context).viewTicket,
                  titleSize: 15.sp,
                  onPressed: () {},
                ),
              ),
              20.pw,
              Expanded(
                child: PublicOutlineButton(
                  title: S.of(context).cancelBooking,
                  titleSize: 15.sp,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}