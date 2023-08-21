import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ContainerServices extends StatefulWidget {
  final String nameAsset;
  final String nameServices;
  const ContainerServices({
    super.key,
    required this.nameAsset,
    required this.nameServices,
  });

  @override
  State<ContainerServices> createState() => _ContainerServicesState();
}

class _ContainerServicesState extends State<ContainerServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            spreadRadius: 0.5,
            offset: Offset(0.0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            widget.nameAsset,
            height: 68.h,
            width: 68.h,
          ),
          PublicText(
            txt: widget.nameServices,
            color: AppColors.orange,
          ),
        ],
      ),
    );
  }
}
