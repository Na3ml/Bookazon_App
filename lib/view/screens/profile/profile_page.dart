import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view_model/profile/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return cubit.image == null
                      ? CircleAvatar(
                          radius: 70.w,
                          backgroundColor: AppColors.purple,
                          child: const PublicText(
                            txt: "No Image",
                            color: AppColors.white,
                          ),
                        )
                      : CircleAvatar(
                          radius: 70.w,
                          backgroundImage: Image.file(cubit.image!).image,
                        );
                },
              ),
              16.ph,
              PublicText(
                txt: "Kezia Ajibastin",
                size: 24.sp,
                fw: FontWeight.w600,
              ),
              8.ph,
              PublicText(
                txt: "ezia_ajibastin@domain.com",
                size: 14.sp,
                fw: FontWeight.w500,
              ),
              InkWell(
                onTap: ()=> Navigator.pushNamed(context, AppRoutes.editProfile),
                child: ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: PublicText(
                    txt: S.of(context).editProfile,
                    color: AppColors.subTitleBlack,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.payment_outlined),
                title: PublicText(
                  txt: S.of(context).payment,
                  color: AppColors.subTitleBlack,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: PublicText(
                  txt: S.of(context).notificaiton,
                  color: AppColors.subTitleBlack,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.security_outlined),
                title: PublicText(
                  txt: S.of(context).security,
                  color: AppColors.subTitleBlack,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: PublicText(
                  txt: S.of(context).help,
                  color: AppColors.subTitleBlack,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.remove_red_eye_outlined),
                title: PublicText(
                  txt: S.of(context).darkTheme,
                  color: AppColors.subTitleBlack,
                ),
                trailing: Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    onChanged: (value) {},
                    value: false,
                    activeColor: AppColors.purple,
                    // thumbColor: Colors.amber,
                    // trackColor: Colors.blue,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: PublicText(
                  txt: S.of(context).deleteAccount,
                  color: AppColors.subTitleBlack,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: AppColors.red,
                ),
                title: Text(
                  S.of(context).logout,
                  style: const TextStyle(color: AppColors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}