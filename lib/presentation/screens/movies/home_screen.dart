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
    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlides(movies: slidesMovies),
        MovieHorizontalListView(
          movies: nowPlayingMovies,
          title: 'En Cines',
          subTitle: 'Lunes 20',
        )
      ],
    );
  }
}
