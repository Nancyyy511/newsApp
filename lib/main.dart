import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/theme/app_theme.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/news/view/screens/main_screen.dart';
import 'package:news_app/news/view_model/app_settings_cubit/app_settings_cubit.dart';
import 'package:news_app/news/view_model/app_settings_cubit/app_settings_state.dart';

void main() {
  runApp(
    // App-wide settings (theme and language) are needed by the whole app.
    // MainLayerCubit is provided lower, in MainScreen.
    BlocProvider(create: (_) => AppSettingsCubit(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to the settings so the whole app rebuilds
    // when the user changes the theme or the language.
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, settings) {
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          builder: (context, child) => MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: settings.themeMode,
            locale: settings.locale,
            // Register the generated translations so that
            // AppLocalizations.of(context) can find them (otherwise it returns null).
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const MainScreen(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
