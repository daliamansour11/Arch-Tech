part of 'html__cubit.dart';


class HtmlState extends Equatable {
  final bool isLoading;
  final String htmlText;
  final String? error;

  const HtmlState({this.isLoading = false, this.htmlText = '', this.error});

  HtmlState copyWith({bool? isLoading, String? htmlText, String? error}) {
    return HtmlState(
      isLoading: isLoading ?? this.isLoading,
      htmlText: htmlText ?? this.htmlText,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, htmlText, error];
}
