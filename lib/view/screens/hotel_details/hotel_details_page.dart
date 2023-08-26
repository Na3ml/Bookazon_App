import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/constants/app_constants.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_divider.dart';
import 'package:bookazon/view/widgets/public_outline_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view_model/hotel_details/hotel_details_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/facilite_model.dart';
import '../../../resources/style/app_colors.dart';
import '../../widgets/public_title_tile.dart';

part 'components/facilite_container.dart';
part 'components/review_card.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({super.key});

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  late final HotelDetailsCubit cubit;
  late final CarouselController carouselController;

  @override
  void initState() {
    super.initState();
    cubit = HotelDetailsCubit.get(context);
    carouselController = CarouselController();
  }

  @override
  void dispose() {
    cubit.addRoomView(false);
    super.dispose();
  }

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
                        BlocBuilder<HotelDetailsCubit, HotelDetailsState>(
                          buildWhen: (_, current) => current is FavoriteState,
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                cubit.changeFavorite();
                              },
                              child: FaIcon(
                                cubit.isFavorite
                                    ? FontAwesomeIcons.solidHeart
                                    : FontAwesomeIcons.heart,
                                color: AppColors.purple,
                              ),
                            );
                          },
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
                                text: '29\$',
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
                          color: AppColors.purple,
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
                    PublicTitleTile(title: S.of(context).hotelPhotos),
                    SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(Assets.imageRoom),
                          );
                        },
                        separatorBuilder: (_, __) => 10.pw,
                      ),
                    ),
                    PublicTitleTile(
                      title: S.of(context).facilites,
                      seeAllOnTap: () =>
                          Navigator.pushNamed(context, AppRoutes.hotelPhotos),
                    ),
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
                    BlocBuilder<HotelDetailsCubit, HotelDetailsState>(
                      buildWhen: (previous, current) =>
                          current is RoomViewState,
                      builder: (context, state) {
                        return cubit.isRoomViewed
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PublicText(
                                    txt: S.of(context).rooms,
                                    size: 24.sp,
                                    fw: FontWeight.bold,
                                  ),
                                  15.ph,
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          carouselController.previousPage();
                                        },
                                        child: const Icon(Icons.arrow_back_ios),
                                      ),
                                      10.pw,
                                      Expanded(
                                        child: CarouselSlider(
                                          items: List.filled(
                                              4, const RoomViewContainer()),
                                          carouselController:
                                              carouselController,
                                          options: CarouselOptions(
                                            height: 340.h,
                                            aspectRatio: 16 / 9,
                                            viewportFraction: 1,
                                            initialPage: 0,
                                            enableInfiniteScroll: true,
                                            reverse: false,
                                            autoPlay: false,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.4,
                                            scrollDirection: Axis.horizontal,
                                          ),
                                        ),
                                      ),
                                      10.pw,
                                      InkWell(
                                        onTap: () {
                                          carouselController.nextPage();
                                        },
                                        child:
                                            const Icon(Icons.arrow_forward_ios),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : PublicButton(
                                title: S.of(context).selectRoom,
                                onPressed: () {
                                  cubit.addRoomView();
                                },
                              );
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
                    PublicTitleTile(title: S.of(context).reviews),
                    ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const ReviewCard();
                      },
                      separatorBuilder: (_, __) => 12.ph,
                    ),
                    20.ph,
                  ],
                ),
              ),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '29\$',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.purple,
                          ),
                        ),
                        TextSpan(
                          text: '/night',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.hintGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  20.pw,
                  Expanded(
                    child: PublicButton(
                      onPressed: () {},
                      title: S.of(context).bookNow,
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

  //* helper methods
  List<Widget> generateStars(double rate, [double? size]) {
    return [
      for (var i = 0; i < rate.round(); i++)
        Icon(
          Icons.star,
          size: size ?? 25.w,
          color: AppColors.orange,
        ),
      for (var i = 0; i < (5 - rate.round()); i++)
        Icon(
          Icons.star_border_outlined,
          size: size ?? 25.w,
          color: AppColors.orange,
        ),
    ];
  }
}

class RoomViewContainer extends StatelessWidget {
  const RoomViewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            Assets.imageRoom2,
            fit: BoxFit.fill,
            height: 340.h,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 160.h,
              color: AppColors.black.withOpacity(0.64),
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 18.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      PublicText(
                        txt: "Deluxe Room",
                        color: AppColors.white,
                        fw: FontWeight.w500,
                        size: 20.sp,
                      ),
                      const Spacer(),
                      ...generateStars(4, 20.w),
                    ],
                  ),
                  10.ph,
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: AppColors.orange,
                        size: 14.w,
                      ),
                      10.pw,
                      PublicText(
                        txt: "2 persons",
                        color: AppColors.white,
                        size: 14.sp,
                      ),
                    ],
                  ),
                  10.ph,
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '29\$',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                              ),
                            ),
                            TextSpan(
                              text: '/night',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      PublicOutlineButton(
                        title: S.of(context).bookNow,
                        backgroundColor: Colors.transparent,
                        titleSize: 14.sp,
                        titleColor: AppColors.white,
                        width: 120.w,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //* helper methods
  List<Widget> generateStars(double rate, [double? size]) {
    return [
      for (var i = 0; i < rate.round(); i++)
        Icon(
          Icons.star,
          size: size ?? 25.w,
          color: AppColors.orange,
        ),
      for (var i = 0; i < (5 - rate.round()); i++)
        Icon(
          Icons.star_border_outlined,
          size: size ?? 25.w,
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
