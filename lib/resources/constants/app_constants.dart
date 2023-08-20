import 'package:bookazon/data/models/onboarding_model.dart';
import 'package:bookazon/resources/constants/app_assets.dart';

import '../localization/generated/l10n.dart';

class AppConstants {
  AppConstants._();

  static List<OnBoardingModel> onboardingContents = [
    OnBoardingModel(
      image: Assets.imageOnboarding1,
      title: S.current.onboardingTitle1,
      description: S.current.onboardingSubtitle1,
    ),
    OnBoardingModel(
      image: Assets.imageOnboarding2,
      title: S.current.onboardingTitle2,
      description: S.current.onboardingSubtitle2,
    ),
    OnBoardingModel(
      image: Assets.imageOnboarding3,
      title: S.current.onboardingTitle3,
      description: S.current.onboardingSubtitle3,
    ),
  ];






  static List listAnswer(context){
    return [
      S.of(context).answer_delete_account1,
      S.of(context).answer_delete_account2,
      S.of(context).answer_delete_account3,
      S.of(context).answer_delete_account4,
      S.of(context).answer_delete_account5,
    ];
  }

  static get select1=>false;
  static get select2=>false;
  static get select3=>false;
  static get select4=>false;
  static get select5=>false;

 static List<bool> listSelect=[
    select1,
    select2,
    select3,
    select4,
    select5,
  ];



}
