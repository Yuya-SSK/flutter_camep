import 'package:camep/src/domain/entities/movie.dart';
import 'package:camep/src/domain/entities/usb_connection_state.dart';
import 'package:camep/src/domain/usecases/get_movies_usecase.dart';
import 'package:camep/src/domain/usecases/get_usb_connection_state_usecase.dart';
import 'package:camep/src/domain/usecases/observe_usb_connection_state_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UsbConnectionStateBlocEvent {}

class _LoadUsbConnectionState extends UsbConnectionStateBlocEvent {}

class _UpdateUsbConnectionState extends UsbConnectionStateBlocEvent {
  final UsbConnectionState usbConnectionState;
  _UpdateUsbConnectionState(this.usbConnectionState);
}

@immutable
class UsbConnectionStateBlocState extends Equatable {
  final UsbConnectionState usbConnectionState;
  const UsbConnectionStateBlocState(this.usbConnectionState);
  @override
  List<Object?> get props => [usbConnectionState];
}

class UsbConnectionStateBloc
    extends Bloc<UsbConnectionStateBlocEvent, UsbConnectionStateBlocState> {
  final GetUsbConnectionUseCase _getUsbConnectionUseCase;
  final ObserveUsbConnectionUseCase _observeUsbConnectionUseCase;
  UsbConnectionStateBloc(
      this._getUsbConnectionUseCase, this._observeUsbConnectionUseCase)
      : super(const UsbConnectionStateBlocState(
            UsbConnectionState.disconnected)) {
    on<_LoadUsbConnectionState>((event, emit) async => emit(
        UsbConnectionStateBlocState(await _getUsbConnectionUseCase.execute())));
    on<_UpdateUsbConnectionState>((event, emit) async =>
        emit(UsbConnectionStateBlocState(event.usbConnectionState)));
    _observeUsbConnectionUseCase
        .execute()
        .listen((state) => add(_UpdateUsbConnectionState(state)));
    add(_LoadUsbConnectionState());
  }
}
