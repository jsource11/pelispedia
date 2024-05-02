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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // Muestra las paginas
    final slidesMovies = ref.watch(moviesSlidesProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        //title: CustomAppbar(),
        title: Text("Pelispedia",
            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text("Pelispedia"),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                //const CustomAppbar(),
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
                  movies: popularMovies,
                  title: 'Populares',
                  subTitle: 'recientes',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'Últimos',
                  subTitle: 'Sabado 22',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'Más Vistos',
                  subTitle: 'Hoy',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                const SizedBox(height: 10)
              ],
            );
          },
          childCount: 1,
        ),
      ),
    ]);
  }
}
