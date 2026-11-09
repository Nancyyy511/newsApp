import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/view/screens/widgets/articles_body.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';

class NewsDetailesView extends StatelessWidget {
  const NewsDetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayerCubit, MainLayerState>(
      // Rebuild only for sources states. Articles states are handled inside
      // each tab (ArticlesBody), so the tabs stay on screen while they load.
      buildWhen: (previous, current) {
        return current is SelectCategoryState ||
            current is GetSourcesLoading ||
            current is GetSourcesSuccess ||
            current is GetSourcesError;
      },
      builder: (context, state) {
        if (state is GetSourcesError) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is MainLayerInitialState ||
            state is SelectCategoryState ||
            state is GetSourcesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<Sources> sources = context.read<MainLayerCubit>().sources;

        if (sources.isEmpty) {
          return const Center(child: Text('No Sources found'));
        }

        // A new sources list gets a new key, so the tabs are created again.
        return _SourcesTabs(key: ObjectKey(sources), sources: sources);
      },
    );
  }
}

class _SourcesTabs extends StatefulWidget {
  final List<Sources> sources;

  const _SourcesTabs({super.key, required this.sources});

  @override
  State<_SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<_SourcesTabs>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.sources.length, vsync: this);
    tabController.addListener(_onTabChanged);

    // Load the articles of the first tab.
    _loadArticles(0);
  }

  void _onTabChanged() {
    // While the tab animation is still running, wait until it finishes.
    if (tabController.indexIsChanging) return;
    _loadArticles(tabController.index);
  }

  void _loadArticles(int index) {
    context.read<MainLayerCubit>().getArticles(widget.sources[index].id ?? '');
  }

  @override
  void dispose() {
    tabController.removeListener(_onTabChanged);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Sources> sources = widget.sources;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).colorScheme.onSurface,
              dividerHeight: 0,
              labelColor: Theme.of(context).colorScheme.onSurface,
              unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
              tabs: sources.map((source) {
                return Tab(text: source.name ?? '');
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: List.generate(
                  sources.length,
                  (index) => ArticlesBody(sourceID: sources[index].id ?? ''),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
