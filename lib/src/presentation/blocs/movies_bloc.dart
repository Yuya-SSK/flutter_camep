import 'package:camep/src/domain/entities/movie.dart';
import 'package:camep/src/domain/usecases/get_movies_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MoviesBlocEvent {}

class GetMovies extends MoviesBlocEvent {}

@immutable
class MoviesBlocState extends Equatable {
  final List<Movie> movies;
  const MoviesBlocState(this.movies);
  @override
  List<Object?> get props => movies;
}

class MoviesBloc extends Bloc<MoviesBlocEvent, MoviesBlocState> {
  final GetMoviesUseCase _getMoviesUseCase;
  MoviesBloc(this._getMoviesUseCase) : super(const MoviesBlocState([])) {
    on<GetMovies>((event, emit) async =>
        emit(MoviesBlocState(await _getMoviesUseCase.execute())));
  }
}
