import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/common/app_data.dart';
import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
import 'package:news_app/screens/views/home_view.dart';
import 'package:news_app/screens/widgets/drawer/app_drawer.dart';
import 'package:news_app/screens/views/news_details_view.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor =
        Theme.of(context).appBarTheme.foregroundColor ??
        Theme.of(context).colorScheme.onSurface;

    // final textColor = Theme.of(context).colorScheme.onSurface;

    return ChangeNotifierProvider(
      create: (BuildContext context) => MainScreenProvider(),
      child: Consumer<MainScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            drawer: const AppDrawer(),

            appBar: AppBar(
              title: Text(provider.categoryEnum?.title ?? 'Home'),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: SvgPicture.asset(
                    AppData.menu,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              actions: [
                IconButton(
                  icon: SvgPicture.asset(
                    AppData.search,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                ),
              ],
            ),

            body: provider.categoryEnum == null
                ? HomeView()
                : NewsDetailesView(),
          );
        },
      ),
    );
  }
}
