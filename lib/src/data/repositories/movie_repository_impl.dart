import 'package:camep/src/domain/entities/movie.dart';
import 'package:camep/src/domain/repositories/movie_repository.dart';
import 'package:camep/src/data/datasources/remote/movie_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;
  const MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<List<Movie>> getMovies() {
    return _movieDataSource.getMovies();
  }
}
