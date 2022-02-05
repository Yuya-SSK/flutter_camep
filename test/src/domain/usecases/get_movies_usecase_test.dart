import 'package:camep/src/domain/entities/movie.dart';
import 'package:camep/src/domain/repositories/movie_repository.dart';
import 'package:camep/src/domain/usecases/get_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

import 'get_movies_usecase_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MovieRepository _movieRepository;
  late GetMoviesUseCase _usecase;

  setUp(() {
    _movieRepository = MockMovieRepository();
    _usecase = GetMoviesUseCase(_movieRepository);
  });

  test('0件取得', () async {
    when(_movieRepository.getMovies()).thenAnswer((_) async => []);
    expect(
        await _usecase.execute(),
        isA<List<Movie>>()
            .having((list) => list, 'isNotNull', isNotNull)
            .having((list) => list.length, 'length', 0));
  });

  test('1件取得', () async {
    when(_movieRepository.getMovies())
        .thenAnswer((_) async => [const Movie('first record')]);
    expect(
        await _usecase.execute(),
        isA<List<Movie>>()
            .having((list) => list, 'isNotNull', isNotNull)
            .having((list) => list.length, 'length', 1)
            .having((list) => list[0].title, 'title', 'first record'));
  });

  test('20件取得', () async {
    when(_movieRepository.getMovies())
        .thenAnswer((_) async => List.generate(20, (_) => const Movie('')));
    expect(
        await _usecase.execute(),
        isA<List<Movie>>()
            .having((list) => list, 'isNotNull', isNotNull)
            .having((list) => list.length, 'length', 20));
  });

  test('エラー', () async {
    when(_movieRepository.getMovies()).thenAnswer((_) => throw ArgumentError());
    expect(
        () => _usecase.execute(), throwsA(const TypeMatcher<ArgumentError>()));
  });
}
