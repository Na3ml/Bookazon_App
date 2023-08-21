part of '../home_page.dart';

class GuestsBottomSheet extends StatelessWidget {
  const GuestsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 15.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: PublicText(
              txt: S.of(context).selectRoomsGuests,
              fw: FontWeight.bold,
              size: 20.sp,
            ),
          ),
          30.ph,
          CounterRow(
            title: S.of(context).rooms,
            type: CounterType.rooms,
            decrement: () {
              cubit.changeRoomsCount(cubit.roomsCount - 1);
            },
            increment: () {
              cubit.changeRoomsCount(cubit.roomsCount + 1);
            },
          ),
          30.ph,
          CounterRow(
            title: S.of(context).adults,
            type: CounterType.adults,
            decrement: () {
              cubit.changeAdultsCount(cubit.adultsCount - 1);
            },
            increment: () {
              cubit.changeAdultsCount(cubit.adultsCount + 1);
            },
          ),
          30.ph,
          CounterRow(
            title: S.of(context).children,
            type: CounterType.children,
            decrement: () {
              cubit.changeChildrenCount(cubit.childrenCount - 1);
            },
            increment: () {
              cubit.changeChildrenCount(cubit.childrenCount + 1);
            },
          ),
          const Spacer(),
          PublicButton(
            onPressed: () {
              Navigator.pop(context);
            },
            title: S.of(context).save,
          ),
          20.ph,
        ],
      ),
    );
  }
}
