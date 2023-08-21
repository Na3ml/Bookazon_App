import 'package:bookazon/resources/constants/app_constants.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view_model/onboarding/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/onboarding_model.dart';
import '../../../resources/style/app_colors.dart';
import '../../widgets/public_text.dart';

part 'components/custom_dots.dart';
part 'components/onboarding_item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    OnboardingCubit.get(context).init();
  }

  @override
  void dispose() {
    OnboardingCubit.get(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = OnboardingCubit.get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
          child: Column(
            children: [
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 20.h,
                    child: Row(
                      children: [
                        CustomDots(myindex: cubit.currentIndex),
                        const Spacer(),
                        cubit.currentIndex < 2
                            ? InkWell(
                                onTap: () {
                                  cubit.skip();
                                },
                                child: PublicText(
                                  txt: S.of(context).skip,
                                  size: 18.sp,
                                  color: AppColors.orange,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
              60.ph,
              SizedBox(
                height: 500.h,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: AppConstants.onboardingContents.length,
                  controller: cubit.pageController,
                  itemBuilder: ((context, index) {
                    return OnboardingItem(
                      onBoarding: AppConstants.onboardingContents[index],
                    );
                  }),
                  onPageChanged: (index) {
                    cubit.changeIndex(index);
                  },
                ),
              ),
              55.ph,
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, _) {
                  return PublicButton(
                    onPressed: () {
                      cubit.onBoardingButton(context);
                    },
                    title: cubit.currentIndex == 2
                        ? S.of(context).getStarted
                        : S.of(context).next,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
