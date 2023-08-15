part of "../home_page.dart";

class TitleTile extends StatelessWidget {
  final String title;
  const TitleTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PublicText(
        txt: title,
        size: 24.sp,
        fw: FontWeight.w600,
      ),
      trailing: InkWell(
        onTap: () {},
        child: PublicText(
          txt: S.of(context).seeMore,
          size: 14.sp,
          fw: FontWeight.normal,
          color: AppColors.orange,
        ),
      ),
    );
  }
}
