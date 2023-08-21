import 'package:bookazon/data/models/booker_model.dart';
import 'package:bookazon/resources/extensions/extensions.dart';
import 'package:bookazon/resources/localization/generated/l10n.dart';
import 'package:bookazon/resources/style/app_colors.dart';
import 'package:bookazon/view/widgets/public_text.dart';
import 'package:bookazon/view_model/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/public_button.dart';
import '../../widgets/public_text_form_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final ProfileCubit cubit;
  late final BookerModel booker;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);
    cubit.initState();
    booker = cubit.getUserInfo();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: PublicText(
            txt: S.of(context).profile,
            size: 26.sp,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40.h, right: 25.w, left: 25.w),
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          cubit.image == null
                              ? CircleAvatar(
                                  radius: 60.w,
                                  backgroundColor: AppColors.orange,
                                  child: const PublicText(
                                    txt: "No Image",
                                    color: AppColors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 60.w,
                                  backgroundImage:
                                      Image.file(cubit.image!).image,
                                ),
                          Positioned(
                            bottom: 20.h,
                            right: 1.w,
                            child: InkWell(
                              onTap: () => cubit.pickImageFromGallery(),
                              child: const Icon(
                                Icons.camera_alt,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  46.ph,
                  Row(
                    children: [
                      Expanded(
                        child: PublicTextFormField(
                          hint: booker.firstName,
                          controller: cubit.firstNameController,
                          keyboardtype: TextInputType.name,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return null;
                            } else if (name.length < 2) {
                              return S.of(context).message_null_username;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: PublicTextFormField(
                          hint: booker.lastName,
                          controller: cubit.lastNameController,
                          keyboardtype: TextInputType.name,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return null;
                            } else if (name.length < 2) {
                              return S.of(context).message_null_username;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  20.ph,
                  PublicTextFormField(
                    hint: booker.email,
                    keyboardtype: TextInputType.emailAddress,
                    controller: cubit.emailController,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return null;
                      } else if (email.isEmailValid()) {
                        return null;
                      } else {
                        return S.of(context).title_error_email;
                      }
                    },
                  ),
                  20.ph,
                  PublicTextFormField(
                    hint: booker.phoneNumber ?? "Phone Number",
                    keyboardtype: TextInputType.phone,
                    controller: cubit.phoneController,
                    validator: (phone) {
                      if (phone == null || phone.isEmpty) {
                        return null;
                      } else if (phone.isMobileNumberValid()) {
                        return null;
                      } else {
                        return S.of(context).title_error_password;
                      }
                    },
                  ),
                  20.ph,
                  PublicTextFormField(
                    hint: booker.address ?? "Address",
                    keyboardtype: TextInputType.text,
                    controller: cubit.addressController,
                    validator: (address) {
                      if (address == null || address.isEmpty) {
                        return null;
                      } else if (address.length > 3) {
                        return null;
                      } else {
                        return S.of(context).title_error_email;
                      }
                    },
                  ),
                  20.ph,
                  PublicTextFormField(
                    hint: booker.paymentCvv ?? "Payment CVV",
                    keyboardtype: TextInputType.number,
                    controller: cubit.paymentController,
                    validator: (cvv) {
                      if (cvv == null || cvv.isEmpty) {
                        return null;
                      } else if (cvv.length == 3) {
                        return null;
                      } else {
                        return S.of(context).title_error_email;
                      }
                    },
                  ),
                  100.ph,
                  PublicButton(
                    title: S.of(context).update,
                    width: 350.w,
                    onPressed: () {
                      if (cubit.updateUserInfo(context, booker)) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}