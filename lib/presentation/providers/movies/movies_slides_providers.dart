import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelispedia/domain/entities/movie.dart';
import 'package:pelispedia/presentation/providers/providers.dart';

final moviesSlidesProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0, 6);
});
