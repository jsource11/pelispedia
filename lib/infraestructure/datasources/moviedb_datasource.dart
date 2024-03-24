import 'package:dio/dio.dart';
import 'package:pelispedia/config/constants/environment.dart';
import 'package:pelispedia/domain/entities/movie.dart';
import 'package:pelispedia/domain/repositories/movies_repository.dart';
import 'package:pelispedia/infraestructure/mappers/movie_mapper.dart';
import 'package:pelispedia/infraestructure/models/moviedb/moviedb_response.dart';

class MoviedbDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-PE'
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
