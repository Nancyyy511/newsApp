import 'package:flutter/material.dart' hide DrawerHeader;
import 'package:news_app/common/app_data.dart';
import 'package:news_app/common/theme/app_colors.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/news/view/screens/widgets/drawer/custom_drawer_header.dart';
import 'package:news_app/news/view/screens/widgets/drawer/drawer_home_button.dart';
import 'package:news_app/news/view/screens/widgets/drawer/drawer_settings_item.dart';
import 'package:news_app/news/view_model/app_settings_cubit/app_settings_cubit.dart';
import 'package:news_app/news/view_model/app_settings_cubit/app_settings_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.primaryWhiteColor;

    // AppSettingsCubit is the single source of truth for theme and language.
    // watch: the drawer rebuilds when the settings change.
    final AppSettingsState settings = context.watch<AppSettingsCubit>().state;
    final AppSettingsCubit settingsCubit = context.read<AppSettingsCubit>();
    final loc = AppLocalizations.of(context)!;

    // Translated labels shown in the dropdowns.
    final lightText = loc.light;
    final darkText = loc.dark;
    final englishText = loc.english;
    final arabicText = loc.arabic;

    // Pick the label that matches the current theme.
    // Only Light and Dark are offered, so anything that is not Dark shows Light.
    final selectedTheme = settings.themeMode == ThemeMode.dark
        ? darkText
        : lightText;

    // Pick the label that matches the current language.
    final selectedLanguage = settings.locale.languageCode == 'ar'
        ? arabicText
        : englishText;

    // The labels change when the language changes, so the dropdowns must be
    // rebuilt from scratch. A key that contains the language code does that.
    final languageCode = settings.locale.languageCode;

    return Drawer(
      width: .7.sw,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColors.primaryBlackColor,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomDrawerHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                const DrawerHomeButton(),

                const SizedBox(height: 16),

                Divider(color: color, endIndent: 16.w, indent: 16.w),

                const SizedBox(height: 16),

                DrawerSettingItem(
                  key: ValueKey('theme_$languageCode'),
                  icon: AppData.theme,
                  title: loc.theme,
                  value: selectedTheme,
                  items: [lightText, darkText],
                  onChanged: (value) {
                    if (value == null) return;

                    if (value == darkText) {
                      settingsCubit.changeTheme(ThemeMode.dark);
                    } else {
                      settingsCubit.changeTheme(ThemeMode.light);
                    }
                  },
                ),

                const SizedBox(height: 24),

                Divider(color: color, endIndent: 16.w, indent: 16.w),

                const SizedBox(height: 24),
                DrawerSettingItem(
                  key: ValueKey('language_$languageCode'),
                  icon: AppData.language,
                  title: loc.language,
                  value: selectedLanguage,
                  items: [englishText, arabicText],
                  onChanged: (value) {
                    if (value == null) return;

                    if (value == arabicText) {
                      settingsCubit.changeLanguage('ar');
                    } else {
                      settingsCubit.changeLanguage('en');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
