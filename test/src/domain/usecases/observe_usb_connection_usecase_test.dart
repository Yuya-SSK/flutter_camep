import 'package:camep/src/domain/entities/usb_connection_state.dart';
import 'package:camep/src/domain/repositories/usb_repository.dart';
import 'package:camep/src/domain/usecases/observe_usb_connection_state_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'observe_usb_connection_usecase_test.mocks.dart';

@GenerateMocks([UsbRepository])
void main() {
  late UsbRepository _usbRepository;
  late ObserveUsbConnectionUseCase _usecase;

  setUp(() {
    _usbRepository = MockUsbRepository();
    _usecase = ObserveUsbConnectionUseCase(_usbRepository);
  });

  test('通知', () async {
    when(_usbRepository.observeUsbConnectionState()).thenAnswer((_) async* {
      yield UsbConnectionState.connected;
      yield UsbConnectionState.disconnected;
    });
    expectLater(
        _usecase.execute(),
        emitsInOrder(
            [UsbConnectionState.connected, UsbConnectionState.disconnected]));
  });
}
