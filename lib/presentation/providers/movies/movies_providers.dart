import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelispedia/domain/entities/movie.dart';
import 'package:pelispedia/presentation/providers/movies/movies_repository_provider.dart';

final nowPlayingMoviesProvider = StateNotifierProvider((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryPorvider).getNowPlaying;

  return MovieNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MovieNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MovieNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [
      ...state,
    ];
  }
}
