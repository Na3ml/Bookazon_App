import 'package:bookazon/data/models/facilite_model.dart';
import 'package:bookazon/data/models/onboarding_model.dart';
import 'package:bookazon/resources/constants/app_assets.dart';

import '../../view/widgets/custom_containe_sections_services.dart';
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

  static List<FaciliteModel> facilites = [
    FaciliteModel(icon: Assets.iconSwimming, name: S.current.pool),
    FaciliteModel(icon: Assets.iconWifi, name: S.current.wifi),
    FaciliteModel(icon: Assets.iconRestaurant, name: S.current.restaurant),
    FaciliteModel(icon: Assets.iconParking, name: S.current.parking),
    FaciliteModel(icon: Assets.iconMeetingRoom, name: S.current.meetingRoom),
    FaciliteModel(icon: Assets.iconElevator, name: S.current.elevator),
    FaciliteModel(icon: Assets.iconGym, name: S.current.gym),
    FaciliteModel(icon: Assets.iconOpen24, name: S.current.open24),
  ];

  static List<String> hotelImage = [
    Assets.imageHotel1,
    Assets.imageHotel2,
    Assets.imageHotel3,
    Assets.imageHotel4,
    Assets.imageHotel5,
  ];

  static List<String> listAnswer(context) {
    return [
      S.of(context).answer_delete_account1,
      S.of(context).answer_delete_account2,
      S.of(context).answer_delete_account3,
      S.of(context).answer_delete_account4,
      S.of(context).answer_delete_account5,
    ];
  }


  static List<ContainerServices> sections = [
    ContainerServices(
      nameAsset: Assets.imageSection1,
      nameServices: S.current.hotel,
    ),
    ContainerServices(
      nameAsset: Assets.imageSection2,
      nameServices: S.current.appartment,
    ),
    ContainerServices(
      nameAsset: Assets.imageSection3,
      nameServices: S.current.glamping,
    ),
    ContainerServices(
      nameAsset: Assets.imageSection4,
      nameServices: S.current.villa,
    ),
  ];
}
