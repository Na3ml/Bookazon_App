import 'dart:io';

import 'package:bookazon/data/data_source/local/app_prefs.dart';
import 'package:bookazon/data/models/booker_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/service_locator/service_locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController paymentController;
  late GlobalKey<FormState> formKey;

  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    paymentController = TextEditingController();
    formKey = GlobalKey();
  }

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    paymentController.dispose();
  }

  File? image;
  Future<void> pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    emit(ChangeImageLoadingState());
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    emit(ChangeImageSuccessState());
  }

  final appPrefs = getIt<AppPrefs>();
  BookerModel getUserInfo() {
    final userInfo = appPrefs.getUserInfo();
    return BookerModel(
      firstName: userInfo[0],
      lastName: userInfo[1],
      email: userInfo[2],
      phoneNumber: userInfo[3],
      gender: userInfo[4],
      address: userInfo[5],
      paymentCvv: userInfo[6],
    );
  }

  bool updateUserInfo(BuildContext context, BookerModel booker) {
    print("outside valid");
    if (formKey.currentState!.validate()) {
      print("inside valid");
      print(firstNameController.text.isNotEmpty.toString());
      appPrefs.setUserInfo(
        firstName: firstNameController.text.isNotEmpty
            ? firstNameController.text
            : booker.firstName,
        lastName: lastNameController.text.isNotEmpty
            ? lastNameController.text
            : booker.lastName,
        email: emailController.text.isNotEmpty
            ? emailController.text
            : booker.email,
        phone: phoneController.text.isNotEmpty
            ? phoneController.text
            : booker.phoneNumber ?? "--",
        address: addressController.text.isNotEmpty
            ? addressController.text
            : booker.address ?? "--",
        paymentCvv: paymentController.text.isNotEmpty
            ? paymentController.text
            : booker.paymentCvv ?? "--",
      );
      // To dismiss keyboard
      FocusScope.of(context).unfocus();
      // TODO: send update to backend

      return true;
    }
    return false;
  }
}
