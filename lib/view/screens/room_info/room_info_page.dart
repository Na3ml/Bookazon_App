import 'package:bookazon/resources/constants/app_assets.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public/public_button.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/localization/generated/l10n.dart';
import '../../widgets/public/public_text.dart';

class RoomInfoPage extends StatelessWidget {
  const RoomInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: PublicText(
            txt: S.of(context).roomInfo,
            size: 25.sp,
            fw: FontWeight.bold,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  Assets.imageRoom2,
                  height: 280.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              20.ph,
              PublicText(
                txt: "Single Room",
                fw: FontWeight.w600,
                size: 22.sp,
              ),
              15.ph,

              // TODO: "ui" - need to arrange chips horizontal
              SizedBox(
                height: 240.h,
                width: double.infinity,
                child: ChipList(
                  listOfChipNames: const [
                    "Breakfast available",
                    "Wifi",
                    "priavte bathroom",
                    "TV",
                    "Blacony",
                    "Friadge",
                    "Room Size: 200ft"
                  ],
                  listOfChipIndicesCurrentlySeclected: const [1],
                  activeTextColorList: const [AppColors.purple],
                  inactiveTextColorList: const [AppColors.purple],
                  activeBgColorList: const [AppColors.white],
                  inactiveBgColorList: const [AppColors.white],
                  activeBorderColorList: const [AppColors.purple],
                  inactiveBorderColorList: const [AppColors.purple],
                  axis: Axis.vertical,
                  shouldWrap: true,
                ),
              ),
              15.ph,
              PublicText(
                txt:
                    "Guests can take anything they want to paly with go home play football, basketball, watching tv and movies Guests can take anything they want to paly with go home play football, basketball, watching tv and movies",
                color: AppColors.subTitleBlack,
                max: 5,
                size: 16.sp,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: PublicButton(
                  title: S.of(context).reserveRoom,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
