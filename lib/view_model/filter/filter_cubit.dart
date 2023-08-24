import 'package:bookazon/resources/constants/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  static FilterCubit get(BuildContext context) => BlocProvider.of(context);

  int countryIndex = 0;
  void changeCountry(int index) {
    countryIndex = index;
    emit(ChangeCountryState(index));
  }

  int sortingIndex = 0;
  void changeSorting(int index) {
    sortingIndex = index;
    emit(ChangeSortingState(index));
  }

  var rangeValues = const RangeValues(10, 80);
  var labels = const RangeLabels("15", "80");
  void changeRange(RangeValues range) {
    rangeValues = range;
    labels = RangeLabels(
      rangeValues.start.toStringAsFixed(1),
      rangeValues.end.toStringAsFixed(1),
    );
    emit(ChangeBudgetRange(range));
  }

  int starIndex = 0;
  void changeStar(int index) {
    starIndex = index;
    emit(ChangeStarState(index));
  }

  List<bool> facilitesCheckBox = List.filled(
    AppConstants.facilites.length,
    false,
  );
  void changeFacilites(int index, bool value) {
    facilitesCheckBox[index] = value;
    emit(ChangeFacilitesState(index: index, value: value));
  }

  List<bool> stayTypesCheckBox = List.filled(
    AppConstants.sections.length,
    false,
  );
  void changestayTypes(int index, bool value) {
    stayTypesCheckBox[index] = value;
    emit(ChangeStayTypeState(index: index, value: value));
  }
}
