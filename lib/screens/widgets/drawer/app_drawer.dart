import 'package:flutter/material.dart' hide DrawerHeader;
import 'package:news_app/common/app_data.dart';
import 'package:news_app/common/theme/app_colors.dart';
import 'package:news_app/screens/widgets/drawer/custom_drawer_header.dart';
import 'package:news_app/screens/widgets/drawer/drawer_home_button.dart';
import 'package:news_app/screens/widgets/drawer/drawer_settings_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String selectedTheme = 'Dark';
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    final color = AppColors.primaryWhiteColor;

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
                  icon: AppData.theme,
                  title: 'Theme',
                  value: selectedTheme,
                  items: const ['Light', 'Dark'],
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      selectedTheme = value;
                    });
                  },
                ),

                const SizedBox(height: 24),

                Divider(color: color, endIndent: 16.w, indent: 16.w),

                const SizedBox(height: 24),
                DrawerSettingItem(
                  icon: AppData.language,
                  title: 'Language',
                  value: selectedLanguage,
                  items: const ['English', 'Arabic'],
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      selectedLanguage = value;
                    });
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
