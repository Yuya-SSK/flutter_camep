import 'package:camep/src/domain/entities/movie.dart';
import 'package:camep/src/domain/repositories/movie_repository.dart';
import 'package:path_provider/path_provider.dart';

class MovieDataSource extends MovieRepository {
  @override
  Future<List<Movie>> getMovies() {
    throw UnimplementedError();
  }
}
