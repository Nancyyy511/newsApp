import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/common/app_data.dart';
import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/news/service_locator/di.dart';

import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';
import 'package:news_app/news/view/screens/sub_views/home_view.dart';
import 'package:news_app/news/view/screens/widgets/drawer/app_drawer.dart';
import 'package:news_app/news/view/screens/sub_views/news_details_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor =
        Theme.of(context).appBarTheme.foregroundColor ??
        Theme.of(context).colorScheme.onSurface;

    // final textColor = Theme.of(context).colorScheme.onSurface;

    return BlocProvider(
      create: (context) => getIt<MainLayerCubit>(),
      child: BlocBuilder<MainLayerCubit, MainLayerState>(
        // Only the selected category matters here (AppBar title and
        // Home/Details view), so do not rebuild for sources/articles states.
        buildWhen: (previous, current) {
          return previous.categoryEnum != current.categoryEnum;
        },
        builder: (context, state) {
          return Scaffold(
            drawer: const AppDrawer(),

            appBar: AppBar(
              title: Text(
                state.categoryEnum?.getTitle(context) ??
                    AppLocalizations.of(context)!.home,
              ),
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

            body: state.categoryEnum == null ? HomeView() : NewsDetailesView(),
          );
        },
      ),
    );
  }
}
