

import 'package:bookazon/view/screens/delete_account/components/consts.dart';
import 'package:bookazon/view_model/delete_account/delete_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountStates>{
  DeleteAccountCubit():super(DeleteAccountInitial());
  static DeleteAccountCubit get(BuildContext context)=> BlocProvider.of(context);

  int currentIndex = 0;
  void changeIndex(int index,bool value) {
    currentIndex = index;
    listSelect[index]=value;

    emit(ChangeCurrentIndexState(index: index));
  }
}