import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/constants/translation_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/common/extensions/string_extensions.dart';
import 'package:movie_with_shams/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_with_shams/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movie_with_shams/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_with_shams/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:movie_with_shams/presentation/widgets/app_error_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc
        .add(MovieTabbedChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                  TabTitleWidget(
                    title: MovieTabbedConstants.movieTabs[i].title,
                    onTap: () => _onTabTapped(i),
                    isSelected: MovieTabbedConstants.movieTabs[i].index ==
                        state.currentTabIndex,
                  ),
              ],
            ),
            SizedBox(
              height: Sizes.dimen_6.h.toDouble(),
            ),
            if (state is MovieTabChanged)
              state.movies.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text(
                          TranslationConstants.noMovies.t(context),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    )
                  : Expanded(
                      child: MovieListViewBuilder(
                        movies: state.movies,
                      ),
                    ),
            if (state is MovieTabLoadError)
              Expanded(
                child: AppErrorWidget(
                  errorType: state.errorType,
                  onPressed: () => movieTabbedBloc.add(
                    MovieTabbedChangedEvent(
                      currentTabIndex: state.currentTabIndex,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabbedChangedEvent(currentTabIndex: index));
  }
}
