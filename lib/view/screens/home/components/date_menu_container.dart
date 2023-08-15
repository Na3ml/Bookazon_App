part of "../home_page.dart";
class DateMenuContainer extends StatelessWidget {
  final String hint;
  const DateMenuContainer({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: 180.w,
      decoration: BoxDecoration(
        color: AppColors.textFieldWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.date_range),
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
    );
  }
}