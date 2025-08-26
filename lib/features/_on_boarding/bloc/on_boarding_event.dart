abstract class OnboardingEvent {}

class ChangePageEvent extends OnboardingEvent {
  final int pageIndex;
  ChangePageEvent(this.pageIndex);
}

class CompleteOnboardingEvent extends OnboardingEvent {}
