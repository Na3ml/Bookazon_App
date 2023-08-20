part of "../home_page.dart";

class DateMenuContainer extends StatelessWidget {
  final String hint;
  final void Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged;
  const DateMenuContainer({
    super.key,
    required this.hint,
    this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              children: [
                SfDateRangePicker(
                  selectionMode: DateRangePickerSelectionMode.single,
                  view: DateRangePickerView.month,
                  initialSelectedDate: DateTime.now(),
                  todayHighlightColor: AppColors.orange,
                  selectionColor: AppColors.orange,
                  onSelectionChanged: onSelectionChanged,
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
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        width: 180.w,
        decoration: BoxDecoration(
          color: AppColors.textFieldWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
             Icon(Icons.date_range,size: 20.w,),
            10.pw,
            PublicText(
              txt: hint,
              color: AppColors.hintGrey,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 40.w,
            ),
          ],
        ),
      ),
    );
  }
}
