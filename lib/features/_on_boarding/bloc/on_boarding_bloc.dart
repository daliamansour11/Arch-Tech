import 'package:archtech/features/_on_boarding/bloc/on_boarding_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, int> {
  OnboardingBloc() : super(0) {
    on<ChangePageEvent>((event, emit) {
      emit(event.pageIndex);
    });
  }
}
