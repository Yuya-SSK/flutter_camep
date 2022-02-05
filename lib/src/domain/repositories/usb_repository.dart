import 'package:camep/src/domain/entities/usb_connection_state.dart';

abstract class UsbRepository {
  Future<UsbConnectionState> getUsbConnectionState();
  Stream<UsbConnectionState> observeUsbConnectionState();
}
