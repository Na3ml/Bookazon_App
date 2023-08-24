import 'package:bookazon/resources/constants/app_constants.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_title_tile.dart';
import 'package:bookazon/view_model/filter/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/localization/generated/l10n.dart';
import '../../widgets/public_button.dart';
import '../../widgets/public_outline_button.dart';
import '../../widgets/public_text.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.get(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: PublicText(
            txt: S.of(context).filterHotels,
            fw: FontWeight.bold,
            size: 20.sp,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PublicTitleTile(
                        title: S.of(context).country,
                      ),
                      BlocBuilder<FilterCubit, FilterState>(
                        buildWhen: (_, current) =>
                            current is ChangeCountryState,
                        builder: (context, state) {
                          return SizedBox(
                            height: 80.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: AppConstants.countries.length,
                              itemBuilder: (_, index) {
                                return ChoiceChip(
                                  label: PublicText(
                                    txt: AppConstants.countries[index],
                                    fw: FontWeight.w600,
                                    size: 13.sp,
                                    color: cubit.countryIndex == index
                                        ? AppColors.white
                                        : AppColors.purple,
                                  ),
                                  backgroundColor: AppColors.white,
                                  selectedColor: AppColors.purple,
                                  selected: cubit.countryIndex == index,
                                  onSelected: (_) {
                                    cubit.changeCountry(index);
                                  },
                                );
                              },
                              separatorBuilder: (_, __) => 20.pw,
                            ),
                          );
                        },
                      ),
                      26.ph,
                      PublicText(
                        txt: S.of(context).sort,
                        fw: FontWeight.w600,
                        size: 24.sp,
                      ),
                      10.ph,
                      BlocBuilder<FilterCubit, FilterState>(
                        buildWhen: (_, current) =>
                            current is ChangeSortingState,
                        builder: (context, state) {
                          return SizedBox(
                            height: 80.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: AppConstants.sortingsType.length,
                              itemBuilder: (_, index) {
                                return ChoiceChip(
                                  label: PublicText(
                                    txt: AppConstants.sortingsType[index],
                                    fw: FontWeight.w600,
                                    size: 13.sp,
                                    color: cubit.sortingIndex == index
                                        ? AppColors.white
                                        : AppColors.purple,
                                  ),
                                  backgroundColor: AppColors.white,
                                  selectedColor: AppColors.purple,
                                  selected: cubit.sortingIndex == index,
                                  onSelected: (_) {
                                    cubit.changeSorting(index);
                                  },
                                );
                              },
                              separatorBuilder: (_, __) => 20.pw,
                            ),
                          );
                        },
                      ),
                      26.ph,
                      PublicText(
                        txt: S.of(context).priceRangePerNight,
                        fw: FontWeight.w600,
                        size: 24.sp,
                      ),
                      40.ph,
                      BlocBuilder<FilterCubit, FilterState>(
                        buildWhen: (_, current) => current is ChangeBudgetRange,
                        builder: (context, state) {
                          return RangeSlider(
                            min: 0,
                            max: 100,
                            values: cubit.rangeValues,
                            labels: cubit.labels,
                            divisions: 100,
                            activeColor: AppColors.purple,
                            inactiveColor: AppColors.purple.withOpacity(0.2),
                            onChanged: (range) {
                              cubit.changeRange(range);
                            },
                          );
                        },
                      ),
                      26.ph,
                      PublicText(
                        txt: S.of(context).starRating,
                        fw: FontWeight.w600,
                        size: 24.sp,
                      ),
                      10.ph,
                      BlocBuilder<FilterCubit, FilterState>(
                        buildWhen: (_, current) => current is ChangeStarState,
                        builder: (context, state) {
                          return SizedBox(
                            height: 80.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: AppConstants.stars.length,
                              itemBuilder: (_, index) {
                                return ChoiceChip(
                                  label: PublicText(
                                    txt: AppConstants.stars[index],
                                    fw: FontWeight.w600,
                                    size: 13.sp,
                                    color: cubit.starIndex == index
                                        ? AppColors.white
                                        : AppColors.purple,
                                  ),
                                  backgroundColor: AppColors.white,
                                  selectedColor: AppColors.purple,
                                  selected: cubit.starIndex == index,
                                  onSelected: (_) {
                                    cubit.changeStar(index);
                                  },
                                );
                              },
                              separatorBuilder: (_, __) => 20.pw,
                            ),
                          );
                        },
                      ),
                      26.ph,
                      PublicText(
                        txt: S.of(context).facilites,
                        fw: FontWeight.w600,
                        size: 24.sp,
                      ),
                      10.ph,
                      BlocBuilder<FilterCubit, FilterState>(
                        buildWhen: (_, current) =>
                            current is ChangeFacilitesState,
                        builder: (context, state) {
                          return SizedBox(
                            height: 60.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: AppConstants.facilites.length,
                              itemBuilder: (_, index) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: cubit.facilitesCheckBox[index],
                                      activeColor: AppColors.purple,
                                      onChanged: (value) {
                                        cubit.changeFacilites(
                                            index, value ?? false);
                                      },
                                    ),
                                    PublicText(
                                      txt: AppConstants.facilites[index].name,
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (_, __) => 20.pw,
                            ),
                          );
                        },
                      ),
                      26.ph,
                      PublicText(
                        txt: S.of(context).accommodationType,
                        fw: FontWeight.w600,
                        size: 24.sp,
                      ),
                      10.ph,
                      BlocBuilder<FilterCubit, FilterState>(
                        buildWhen: (_, current) =>
                            current is ChangeStayTypeState,
                        builder: (context, state) {
                          return SizedBox(
                            height: 60.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: AppConstants.sections.length,
                              itemBuilder: (_, index) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: cubit.stayTypesCheckBox[index],
                                      activeColor: AppColors.purple,
                                      onChanged: (value) {
                                        cubit.changestayTypes(
                                            index, value ?? false);
                                      },
                                    ),
                                    PublicText(
                                      txt: AppConstants
                                          .sections[index].nameServices,
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (_, __) => 20.pw,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              20.ph,
              Row(
                children: [
                  Expanded(
                    child: PublicOutlineButton(
                      title: S.of(context).reset,
                      onPressed: ()=>Navigator.pop(context),
                    ),
                  ),
                  20.pw,
                  Expanded(
                    child: PublicButton(
                      title: S.of(context).applyFilter,
                      onPressed: ()=>Navigator.pop(context),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
