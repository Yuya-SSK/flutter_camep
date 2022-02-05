abstract class SingleUseCase<T, P> {
  Future<T> execute({P params});
}

abstract class ObservalUseCase<T, P> {
  Stream<T> execute({P params});
}
