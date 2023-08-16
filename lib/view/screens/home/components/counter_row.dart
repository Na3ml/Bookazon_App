part of '../home_page.dart';

enum CounterType {
  rooms,
  adults,
  children,
}

class CounterRow extends StatelessWidget {
  final void Function() decrement;
  final void Function() increment;
  final String title;
  final CounterType type;
  const CounterRow({
    super.key,
    required this.decrement,
    required this.increment,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PublicText(
              txt: title,
              color: AppColors.subTitleBlack,
              size: 18.sp,
            ),
            type == CounterType.children
                ? Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: PublicText(
                      txt: S.of(context).ages17,
                      color: AppColors.subTitleGrey,
                      size: 16.sp,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        const Spacer(),
        FloatingActionButton.small(
          onPressed: decrement,
          backgroundColor: AppColors.orange,
          child: const Icon(Icons.remove),
        ),
        20.pw,
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return PublicText(
              txt: getCounter(type, cubit).toString(),
              color: AppColors.subTitleBlack,
              size: 18.sp,
            );
          },
        ),
        20.pw,
        FloatingActionButton.small(
          onPressed: increment,
          backgroundColor: AppColors.orange,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  /// helper methods
  int getCounter(CounterType type, HomeCubit cubit) {
    switch (type) {
      case CounterType.rooms:
        return cubit.roomsCount;
      case CounterType.adults:
        return cubit.adultsCount;
      case CounterType.children:
        return cubit.childrenCount;
      default:
        return 0;
    }
  }
}