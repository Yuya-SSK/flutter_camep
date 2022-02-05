import 'package:bloc_test/bloc_test.dart';
import 'package:camep/src/domain/entities/movie.dart';
import 'package:camep/src/domain/repositories/movie_repository.dart';
import 'package:camep/src/domain/usecases/get_movies_usecase.dart';
import 'package:camep/src/presentation/blocs/movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movies_bloc_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MovieRepository _movieRepository;

  setUp(() {
    _movieRepository = MockMovieRepository();
  });

  blocTest<MoviesBloc, MoviesBlocState>(
    '1件取得',
    build: () {
      when(_movieRepository.getMovies())
          .thenAnswer((_) async => [const Movie('first record')]);
      return MoviesBloc(GetMoviesUseCase(_movieRepository));
    },
    act: (bloc) => bloc.add(GetMovies()),
    expect: () => [
      const MoviesBlocState([Movie('first record')])
    ],
  );
}
