import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/constants/app_constants.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public/public_button.dart';
import 'package:bookazon/view/widgets/public/public_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../view_model/home/home_cubit.dart';
import '../../widgets/public/public_text_form_field.dart';
import '../../widgets/public/public_title_tile.dart';

part 'components/popular_card.dart';
part 'components/date_menu_container.dart';
part 'components/offer_card.dart';
part 'components/counter_row.dart';
part 'components/gusets_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit cubit;

  void _bind() {
    cubit = HomeCubit.get(context);
    cubit.init();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

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
                controller: cubit.searchController,
                borderRadius: 5,
                validator: null,
              ),
              8.ph,
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DateMenuContainer(
                        hint: cubit.fromDate == null
                            ? S.of(context).from
                            : cubit.fromDate!.format1,
                        onSelectionChanged: (date) {
                          cubit.changeFromDate(date.value);
                        },
                      ),
                      5.pw,
                      DateMenuContainer(
                        hint: cubit.toDate == null
                            ? S.of(context).to
                            : cubit.toDate!.format1,
                        onSelectionChanged: (date) {
                          cubit.changeToDate(date.value);
                        },
                      ),
                    ],
                  );
                },
              ),
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const GuestsBottomSheet();
                          },
                        );
                      },
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return Container(
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
                                      "${cubit.roomsCount} ${S.of(context).rooms} . ${cubit.adultsCount} ${S.of(context).adults} . ${cubit.childrenCount} ${S.of(context).children}",
                                  color: AppColors.hintGrey,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  5.pw,
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.search);
                    },
                    child: Container(
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
                    ),
                  )
                ],
              ),
              PublicTitleTile(
                title: S.of(context).sections,
              ),
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
              PublicTitleTile(
                title: S.of(context).offer,
                seeAllOnTap: () =>
                    Navigator.pushNamed(context, AppRoutes.offer),
              ),
              SizedBox(
                height: 160.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => const OfferCard(),
                  separatorBuilder: (context, index) => 10.pw,
                ),
              ),
              PublicTitleTile(title: S.of(context).popular),
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
