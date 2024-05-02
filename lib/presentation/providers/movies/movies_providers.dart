import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelispedia/domain/entities/movie.dart';
import 'package:pelispedia/presentation/providers/movies/movies_repository_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryPorvider).getNowPlaying;
  return MovieNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );
});

final popularMoviesProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryPorvider).getNowPopular;
  return MovieNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

// Estado cambiado | Notifica
class MovieNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;
  bool isLoading = false;

  MovieNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
