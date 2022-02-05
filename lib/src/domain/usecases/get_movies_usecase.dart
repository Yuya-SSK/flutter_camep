import 'package:camep/src/domain/entities/movie.dart';
import 'package:camep/src/domain/usecases/usecase.dart';
import 'package:camep/src/domain/repositories/movie_repository.dart';

class GetMoviesUseCase implements SingleUseCase<List<Movie>, void> {
  final MovieRepository _movieRepository;

  GetMoviesUseCase(this._movieRepository);

  @override
  Future<List<Movie>> execute({void params}) => _movieRepository.getMovies();
}
