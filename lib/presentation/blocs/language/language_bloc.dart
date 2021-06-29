import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/languages.dart';
import 'package:movie_with_shams/domain/entities/language_entity.dart';
import 'package:movie_with_shams/domain/entities/no_params.dart';
import 'package:movie_with_shams/domain/usecases/get_preferred_language.dart';
import 'package:movie_with_shams/domain/usecases/update_language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({
    required this.getPreferredLanguage,
    required this.updateLanguage,
  }) : super(
          LanguageLoaded(
            Locale(Languages.languages[0].code),
          ),
        );

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      await updateLanguage(event.language.code);
      add(LoadPreferredLanguageEvent());
    } else if (event is LoadPreferredLanguageEvent) {
      final response = await getPreferredLanguage(NoParams());
      yield response.fold(
        (l) => LanguageLoadError(),
        (languageCode) => LanguageLoaded(Locale(languageCode)),
      );
    }
  }
}
