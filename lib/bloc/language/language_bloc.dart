import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<LanguageChanged>(_changeLanguage);
  }

  void _changeLanguage(LanguageChanged event, Emitter<LanguageState> emit) {
    emit(state.copyWith(locale: event.locale));
  }
}
