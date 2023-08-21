part of '../hotel_details_page.dart';

class FaciliteContainer extends StatelessWidget {
  final FaciliteModel facilite;
  const FaciliteContainer({super.key, required this.facilite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(facilite.icon),
        5.ph,
        PublicText(
          txt: facilite.name,
          size: 14.sp,
          color: AppColors.subTitleBlack,
        ),
      ],
    );
  }
}