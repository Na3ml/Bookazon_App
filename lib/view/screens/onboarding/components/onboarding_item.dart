part of '../onboarding_page.dart';

class OnboardingItem extends StatelessWidget {
  final OnBoardingModel onBoarding;
  const OnboardingItem({
    Key? key,
    required this.onBoarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          onBoarding.image,
          height: 350.h,
          width: double.infinity,
        ),
        30.ph,
        PublicText(
          txt: onBoarding.title,
          color: AppColors.black,
          fw: FontWeight.bold,
          size: 25.sp,
        ),
        16.ph,
        PublicText(
          txt: onBoarding.description,
          color: AppColors.hintGrey,
          size: 17.sp,
          align: TextAlign.center,
        ),
      ],
    );
  }
}