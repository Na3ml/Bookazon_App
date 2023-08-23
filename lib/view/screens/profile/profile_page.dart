import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/router/app_router.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_button.dart';
import 'package:bookazon/view/widgets/public_divider.dart';
import 'package:bookazon/view/widgets/public_outline_button.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view_model/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/auth/auth_cubit.dart';
import '../../widgets/public_switch_list_tile.dart';

part 'components/logout_bottom_sheet.dart';

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
                          backgroundColor: AppColors.orange,
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
                txt:
                    "${cubit.getUserInfo().firstName} ${cubit.getUserInfo().lastName}",
                size: 24.sp,
                fw: FontWeight.w600,
              ),
              8.ph,
              PublicText(
                txt: cubit.getUserInfo().email,
                size: 14.sp,
                fw: FontWeight.w500,
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.editProfile),
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
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.securitySettings),
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
              PublicSwitchListTile(
                title: S.of(context).darkTheme,
                swithcer: Switchers.darkMode,
                icon: const Icon(Icons.dark_mode),
              ),
              ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.deleteAccount),
                leading: const Icon(Icons.delete_outline),
                title: PublicText(
                  txt: S.of(context).deleteAccount,
                  color: AppColors.subTitleBlack,
                ),
              ),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return const LogoutBottomSheet();
                    },
                  );
                },
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
