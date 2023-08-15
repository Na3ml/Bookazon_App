part of "../home_page.dart";

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 0.5,
                offset: Offset(0.0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PublicText(
                        txt: S.of(context).planTrip,
                        size: 22.sp,
                        fw: FontWeight.w600,
                      ),
                      10.ph,
                      PublicText(
                        txt:
                            "Choose your favourate destination and plan your next excape",
                        size: 11.sp,
                        fw: FontWeight.normal,
                        color: AppColors.hintGrey,
                        max: 3,
                        align: TextAlign.center,
                      ),
                      15.ph,
                      InkWell(
                        onTap: () {},
                        child: PublicText(
                          txt: S.of(context).bookNow,
                          size: 14.sp,
                          fw: FontWeight.w500,
                          color: AppColors.orange,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Image.asset(
                  Assets.imageOffer1,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10.h,
          right: 79.w,
          child: CircleAvatar(
            backgroundColor: AppColors.orange,
            radius: 30.w,
            child: PublicText(
              txt: "Up to\n 40%\n Off",
              color: AppColors.white,
              max: 4,
              size: 14.sp,
            ),
          ),
        )
      ],
    );
  }
}