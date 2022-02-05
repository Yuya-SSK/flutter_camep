import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Movie extends Equatable {
  final String title;
  const Movie(this.title);
  @override
  List<Object> get props => [title];
}
