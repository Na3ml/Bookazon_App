import 'package:bookazon/data/data_source/local/app_prefs.dart';
import 'package:bookazon/resources/constants/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/router/app_router.dart';
import '../../resources/service_locator/service_locator.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  late final PageController pageController;

  void init() {
    pageController = PageController();
  }

  void dispose() {
    pageController.dispose();
  }

  final appPrefs = getIt<AppPrefs>();
  void onBoardingButton(BuildContext context) {
    if (currentIndex == 2) {
      appPrefs.setOnBoardingViewed();
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.login,
      );
    } else {
      increaseIndex();
    }
  }

  void skip() {
    currentIndex = AppConstants.onboardingContents.length - 1;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    emit(
      ChangeCurrentIndexState(
        index: currentIndex,
      ),
    );
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState(index: index));
  }

  void increaseIndex() {
    if (currentIndex < AppConstants.onboardingContents.length) {
      currentIndex++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
      emit(
        ChangeCurrentIndexState(
          index: currentIndex,
        ),
      );
    }
  }

  void decreaseIndex() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
      emit(
        ChangeCurrentIndexState(
          index: currentIndex,
        ),
      );
    }
  }
}
