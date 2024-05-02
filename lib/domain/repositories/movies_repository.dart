import 'package:pelispedia/domain/entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getNowPopular({int page = 1});
}
