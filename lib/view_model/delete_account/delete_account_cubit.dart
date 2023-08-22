import 'package:bookazon/data/data_source/local/app_prefs.dart';
import 'package:bookazon/resources/service_locator/service_locator.dart';
import 'package:bookazon/view_model/delete_account/delete_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountStates> {
  DeleteAccountCubit() : super(DeleteAccountInitial());
  static DeleteAccountCubit get(BuildContext context) =>
      BlocProvider.of(context);

  int currentIndex = -1;
  void changeIndex(int index) {
    currentIndex = index;

    emit(ChangeCurrentIndexState(index: index));
  }

  final appPrefs = getIt<AppPrefs>();
  void confirmDelete() {
    appPrefs.removeToken();
    appPrefs.logout();
  }
}
