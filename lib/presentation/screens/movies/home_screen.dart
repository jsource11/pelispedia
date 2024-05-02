import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelispedia/presentation/providers/providers.dart';
import 'package:pelispedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    // Lee las páginas
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // Muestra las paginas
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slidesMovies = ref.watch(moviesSlidesProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppbar(),
          MoviesSlides(movies: slidesMovies),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Extrenos',
            subTitle: 'Martes 10',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Próximamente',
            subTitle: 'Sábado 22',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Populares',
            subTitle: 'recientes',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
