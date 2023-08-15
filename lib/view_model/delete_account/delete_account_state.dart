import 'package:equatable/equatable.dart';


abstract class DeleteAccountStates extends  Equatable{
  const DeleteAccountStates();
  @override
  List<Object> get props => [];
}

class DeleteAccountInitial extends DeleteAccountStates {}

class ChangeCurrentIndexState extends DeleteAccountStates {
  final int index;
  const ChangeCurrentIndexState({required this.index});

  @override
  List<Object> get props => [index];
}