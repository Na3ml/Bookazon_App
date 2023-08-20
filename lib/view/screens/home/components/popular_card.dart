part of "../home_page.dart";

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.hotelDetails);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0.0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(6),
              ),
              child: Image.asset(
                Assets.imageHotel1,
                height: 150.h,
                fit: BoxFit.fill,
              ),
            ),
            22.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: PublicText(
                txt: "Lavander Hotel",
                size: 20.sp,
              ),
            ),
            9.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [...generateStars(4)],
              ),
            ),
            10.ph,
          ],
        ),
      ),
    );
  }
  
  //* helper methods
  List<Widget> generateStars(double rate) {
    return [
      for (var i = 0; i < rate.round(); i++)
        Icon(
          Icons.star,
          size: 12.sp,
          color: AppColors.orange,
        ),
      for (var i = 0; i < (5 - rate.round()); i++)
        Icon(
          Icons.star_border_outlined,
          size: 12.sp,
          color: AppColors.orange,
        ),
    ];
  }
}