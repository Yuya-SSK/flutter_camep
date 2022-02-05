import 'package:camep/src/domain/entities/usb_connection_state.dart';
import 'package:camep/src/domain/repositories/usb_repository.dart';
import 'package:camep/src/domain/usecases/get_usb_connection_state_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

import 'get_usb_connection_state_test.mocks.dart';

@GenerateMocks([UsbRepository])
void main() {
  late UsbRepository _usbRepository;
  late GetUsbConnectionUseCase _usecase;

  setUp(() {
    _usbRepository = MockUsbRepository();
    _usecase = GetUsbConnectionUseCase(_usbRepository);
  });

  test('接続状態取得', () async {
    when(_usbRepository.getUsbConnectionState())
        .thenAnswer((_) async => UsbConnectionState.connected);
    expect(await _usecase.execute(), UsbConnectionState.connected);
  });

  test('未接続状態取得', () async {
    when(_usbRepository.getUsbConnectionState())
        .thenAnswer((_) async => UsbConnectionState.disconnected);
    expect(await _usecase.execute(), UsbConnectionState.disconnected);
  });
}
