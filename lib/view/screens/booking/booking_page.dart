import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_divider.dart';
import 'package:bookazon/view/widgets/public_outline_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view_model/booking/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'components/ongoing_card.dart';
part 'components/final_card.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BookingCubit.get(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: PublicText(
            txt: S.of(context).myBooking,
            fw: FontWeight.w600,
            size: 20.sp,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          child: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: PublicButton(
                          title: S.of(context).ongoing,
                          titleSize: 13.sp,
                          backgroundColor: cubit.bookingType != 0
                              ? AppColors.white
                              : AppColors.purple,
                          titleColor: cubit.bookingType != 0
                              ? AppColors.purple
                              : AppColors.white,
                          onPressed: () {
                            cubit.changeType(0);
                          },
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: PublicButton(
                          title: S.of(context).completed,
                          titleSize: 13.sp,
                          backgroundColor: cubit.bookingType != 1
                              ? AppColors.white
                              : AppColors.purple,
                          titleColor: cubit.bookingType != 1
                              ? AppColors.purple
                              : AppColors.white,
                          onPressed: () {
                            cubit.changeType(1);
                          },
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: PublicButton(
                          title: S.of(context).canceled,
                          titleSize: 13.sp,
                          backgroundColor: cubit.bookingType != 2
                              ? AppColors.white
                              : AppColors.purple,
                          titleColor: cubit.bookingType != 2
                              ? AppColors.purple
                              : AppColors.white,
                          onPressed: () {
                            cubit.changeType(2);
                          },
                        ),
                      ),
                    ],
                  ),
                  35.ph,
                  Expanded(
                    child: ListView.separated(
                      itemCount: 8,
                      itemBuilder: (_, index) {
                        switch (cubit.bookingType) {
                          case 0:
                            return const OngoingCard();
                          case 1:
                            return const FinalCard(isCompleted: true);
                          case 2:
                            return const FinalCard(isCompleted: false);
                          default:
                            return const SizedBox();
                        }
                      },
                      separatorBuilder: (_, __) => 20.ph,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
