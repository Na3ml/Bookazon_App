part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class ChangeCurrentIndexState extends OnboardingState {
  final int index;
  const ChangeCurrentIndexState({required this.index});

  @override
  List<Object> get props => [index];
}
