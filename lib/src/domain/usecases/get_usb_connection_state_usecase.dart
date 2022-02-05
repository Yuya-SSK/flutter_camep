import 'package:camep/src/domain/entities/usb_connection_state.dart';
import 'package:camep/src/domain/repositories/usb_repository.dart';
import 'package:camep/src/domain/usecases/usecase.dart';

class GetUsbConnectionUseCase
    implements SingleUseCase<UsbConnectionState, void> {
  final UsbRepository _usbRepository;

  GetUsbConnectionUseCase(this._usbRepository);

  @override
  Future<UsbConnectionState> execute({void params}) =>
      _usbRepository.getUsbConnectionState();
}
