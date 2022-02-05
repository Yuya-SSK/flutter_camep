import 'package:camep/src/domain/entities/usb_connection_state.dart';
import 'package:camep/src/domain/repositories/usb_repository.dart';
import 'package:camep/src/data/datasources/remote/usb_data_source.dart';

class UsbRepositoryImpl implements UsbRepository {
  final UsbDataSource _usbDataSource;
  const UsbRepositoryImpl(this._usbDataSource);

  @override
  Future<UsbConnectionState> getUsbConnectionState() =>
      _usbDataSource.getUsbConnectionState();

  @override
  Stream<UsbConnectionState> observeUsbConnectionState() =>
      _usbDataSource.observeUsbConnectionState();
}
