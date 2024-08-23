part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
  @override
  List<Object> get props => [];
}

class LanguageChanged extends LanguageEvent {
  final Locale locale;

  const LanguageChanged(this.locale);

  @override
  List<Object> get props => [locale];
}

class GetLanguage extends LanguageEvent {
  const GetLanguage();
}
