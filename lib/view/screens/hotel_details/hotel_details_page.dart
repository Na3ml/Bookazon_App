import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/constants/app_constants.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/view/screens/home/home_page.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_divider.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/facilite_model.dart';
import '../../../resources/style/app_colors.dart';
import '../../widgets/public_title_tile.dart';

part 'components/facilite_container.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: PublicText(
            txt: S.of(context).details,
            size: 26.sp,
            fw: FontWeight.bold,
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios)),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CarouselSlider(
                      items: AppConstants.hotelImage.map((image) {
                        return ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadiusDirectional.circular(8),
                          child: Image.asset(
                            image,
                            height: 250.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 250.h,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    15.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const FaIcon(
                            FontAwesomeIcons.heart,
                            color: AppColors.purple,
                          ),
                        ),
                        Row(
                          children: [
                            ...generateStars(4),
                            10.pw,
                            PublicText(
                              txt: "(81) ${S.of(context).reviews}",
                              color: AppColors.subTitleBlack,
                            )
                          ],
                        )
                      ],
                    ),
                    20.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PublicText(
                          txt: "The Aston Vill Hotel",
                          size: 20.sp,
                          fw: FontWeight.bold,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '\$200,7',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.purple,
                                ),
                              ),
                              TextSpan(
                                text: '/night',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.hintGrey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.ph,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.locationDot,
                          color: AppColors.orange,
                          size: 20.w,
                        ),
                        10.pw,
                        PublicText(
                          txt: "Alice Springs NT 0870, Australia",
                          size: 15.sp,
                          color: AppColors.subTitleGrey,
                        ),
                      ],
                    ),
                    20.ph,
                    const PublicDivider(
                      width: double.infinity,
                      color: AppColors.grey,
                    ),
                    PublicTitleTile(title: S.of(context).facilites),
                    15.ph,
                    GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 150 / 120,
                      ),
                      itemBuilder: (context, index) {
                        return FaciliteContainer(
                            facilite: AppConstants.facilites[index]);
                      },
                    ),
                    10.ph,
                    PublicText(
                      txt: S.of(context).description,
                      size: 24.sp,
                      fw: FontWeight.bold,
                    ),
                    15.ph,
                    PublicText(
                      txt:
                          "Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel. elegant 5 star hotel overlooking the sea. perfect for a romantic, charming ",
                      size: 14.sp,
                      color: AppColors.subTitleGrey,
                      max: 10,
                    ),
                    20.ph,
                  ],
                ),
              ),
              PublicButton(
                onPressed: () {},
                title: S.of(context).bookNow,
              )
            ],
          ),
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
          size: 25.w,
          color: AppColors.orange,
        ),
      for (var i = 0; i < (5 - rate.round()); i++)
        Icon(
          Icons.star_border_outlined,
          size: 25.w,
          color: AppColors.orange,
        ),
    ];
  }
}





/// Draft

  // const Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     Row(
  //       children: [
  //         Icon(
  //           Icons.wifi,
  //         ),
  //         SizedBox(
  //           width: 3,
  //         ),
  //         Text(
  //           "Free Wifi",
  //           style: TextStyle(
  //               color: Color(0xFF101010),
  //               fontWeight: FontWeight.bold),
  //         )
  //       ],
  //     ),
  //     Row(
  //       children: [
  //         FaIcon(FontAwesomeIcons.mugHot),
  //         SizedBox(
  //           width: 4,
  //         ),
  //         Text(
  //           "Free Breakfast",
  //           style: TextStyle(
  //               color: Color(0xFF101010),
  //               fontWeight: FontWeight.bold),
  //         ),
  //       ],
  //     ),
  //     FaIcon(FontAwesomeIcons.chevronDown),
  //   ],
  // ),
  // ---------------------------------------------------------------------------
  //  Row(
  //    children: [
  //      Text(
  //        "Preview",
  //        style: TextStyle(
  //            fontSize: 20.sp,
  //            fontWeight: FontWeight.bold,
  //            color: Colors.black),
  //      ),
  //    ],
  //  ),
  //  const SizedBox(
  //    height: 10,
  //  ),
  //  Row(
  //    mainAxisAlignment: MainAxisAlignment.center,
  //    children: [
  //      Image.asset("assets/image/Image.png"),
  //      Image.asset("assets/image/Image (1).png"),
  //      Image.asset("assets/image/Image (2).png"),
  //    ],
  //  ),
  //  const SizedBox(
  //    height: 10,
  //  ),
