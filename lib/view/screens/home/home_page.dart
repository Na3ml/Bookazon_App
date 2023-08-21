import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/constants/app_constants.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/public_text_form_field.dart';

part 'components/popular_card.dart';
part 'components/date_menu_container.dart';
part 'components/offer_card.dart';
part 'components/title_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 28.w),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(child: Image.asset(Assets.imageLogo)),
              40.ph,
              Row(
                children: [
                  PublicText(
                    txt: S.of(context).whereWantGo,
                    size: 25.sp,
                    fw: FontWeight.w600,
                  ),
                ],
              ),
              40.ph,
              // TODO: "logic" open search bar
              PublicTextFormField(
                hint: S.of(context).goingTo,
                borderRadius: 5,
                validator: null,
              ),
              8.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DateMenuContainer(hint: S.of(context).from),
                  5.pw,
                  DateMenuContainer(hint: S.of(context).to),
                ],
              ),
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      height: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline_outlined),
                          PublicText(
                            txt:
                                "1 ${S.of(context).rooms} . 1 ${S.of(context).adults} . 0 ${S.of(context).children}",
                            color: AppColors.hintGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  5.pw,
                  Container(
                    height: 50.w,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.purple,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              TitleTile(title: S.of(context).sections),
              SizedBox(
                height: 120.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.sections.length,
                  itemBuilder: (_, index) {
                    return AppConstants.sections[index];
                  },
                  separatorBuilder: (_, __) => 8.pw,
                ),
              ),
              TitleTile(title: S.of(context).offer),
              SizedBox(
                height: 160.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => const OfferCard(),
                  separatorBuilder: (context, index) => 10.pw,
                ),
              ),
              TitleTile(title: S.of(context).popular),
              GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 18.w,
                  childAspectRatio: 185 / 235,
                ),
                itemBuilder: (context, index) {
                  return const PopularCard();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
