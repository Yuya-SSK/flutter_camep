import 'package:camep/src/domain/entities/usb_connection_state.dart';
import 'package:camep/src/domain/repositories/usb_repository.dart';
import 'package:camep/src/domain/usecases/usecase.dart';

class ObserveUsbConnectionUseCase
    implements ObservalUseCase<UsbConnectionState, void> {
  final UsbRepository _usbRepository;

  ObserveUsbConnectionUseCase(this._usbRepository);

  @override
  Stream<UsbConnectionState> execute({void params}) =>
      _usbRepository.observeUsbConnectionState();
}
