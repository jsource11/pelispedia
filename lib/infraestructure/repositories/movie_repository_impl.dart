import 'package:pelispedia/domain/entities/movie.dart';
import 'package:pelispedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesDataSource {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getNowPopular({int page = 1}) {
    return dataSource.getNowPopular(page: page);
  }
}
