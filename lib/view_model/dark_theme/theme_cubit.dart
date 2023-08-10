import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class DarkThemeCubit extends Cubit<DarkThemeState> {
  DarkThemeCubit() : super(DarkThemeInitial());
  void toggleDarkTheme (bool theme , ){

  }
}
