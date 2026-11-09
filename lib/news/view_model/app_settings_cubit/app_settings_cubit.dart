import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/view_model/app_settings_cubit/app_settings_state.dart';

// Holds the app-wide settings: theme and language.
class AppSettingsCubit extends Cubit<AppSettingsState> {
  // The app only supports Light and Dark, and starts in Light and English.
  AppSettingsCubit()
    : super(
        AppSettingsState(
          themeMode: ThemeMode.light,
          locale: const Locale('en'),
        ),
      );

  void changeTheme(ThemeMode newThemeMode) {
    emit(AppSettingsState(themeMode: newThemeMode, locale: state.locale));
  }

  void changeLanguage(String languageCode) {
    emit(
      AppSettingsState(
        themeMode: state.themeMode,
        locale: Locale(languageCode),
      ),
    );
  }
}
