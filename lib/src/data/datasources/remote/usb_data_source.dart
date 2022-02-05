import 'package:camep/src/domain/entities/usb_connection_state.dart';
import 'package:camep/src/domain/repositories/usb_repository.dart';

class UsbDataSource implements UsbRepository {
  @override
  Future<UsbConnectionState> getUsbConnectionState() {
    throw UnimplementedError();
  }

  @override
  Stream<UsbConnectionState> observeUsbConnectionState() {
    throw UnimplementedError();
  }
}
