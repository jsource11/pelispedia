import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelispedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:pelispedia/infraestructure/repositories/movie_repository_impl.dart';

final movieRepositoryPorvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDataSource());
});
