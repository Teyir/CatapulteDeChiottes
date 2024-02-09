import 'package:cdc/managers/engine_manager.dart';
import 'package:test/test.dart';

import 'utils/door_spy_test.dart';
import 'utils/fake_reader_test.dart';

void main() {
  //This test check if the test framework is working
  test('TestReady', () => expect(true, true));

  //This test emulate a simple use case with a fake reader and a door spy.
  //We are checking if the door is opened when the badge is detected.
  test('BasicCheck', () {
    final DoorSpy doorSpy = DoorSpy();
    final FakeReader fakeReader = FakeReader([doorSpy]);

    fakeReader.emulateBadgeDetection();

    EngineManager.callReaders([fakeReader]);

    expect(doorSpy.isOpenRequested(), true);
  });

  // This test emulate a simple use case with a fake reader and a door spy.
  // We are checking if the door keep locked when we are not checking the reader.
  test('BasicCheckWithoutCheckingReader', () {
    final DoorSpy doorSpy = DoorSpy();
    final FakeReader fakeReader = FakeReader([doorSpy]);

    EngineManager.callReaders([fakeReader]);

    expect(doorSpy.isOpenRequested(), false);
  });

  // This test emulate a simple use case with a fake reader and a door spy.
  // We are check if the door keep locked when we are not using the badge reader.
  test('BasicCheckWithoutEmulatingBadgeDetection', () {
    final DoorSpy doorSpy = DoorSpy();
    final FakeReader fakeReader = FakeReader([doorSpy]);

    fakeReader.emulateBadgeDetection();

    expect(doorSpy.isOpenRequested(), false);
  });

  // This test emulate a simple use case with a fake reader and 2 doors spy.
  //We are checking if the doors are opened when the badge is detected.
  test('BasicCheckWithMultipleDoors', () {
    final DoorSpy doorSpy1 = DoorSpy();
    final DoorSpy doorSpy2 = DoorSpy();
    final FakeReader fakeReader = FakeReader([doorSpy1, doorSpy2]);

    fakeReader.emulateBadgeDetection();

    EngineManager.callReaders([fakeReader]);

    expect(doorSpy1.isOpenRequested(), true);
    expect(doorSpy2.isOpenRequested(), true);
  });

  // This test emulate a simple use case with two fakes readers and a door spy.
  // We are checking if the door is opened when the badge is detected in one reader.
  test('BasicCheckWithMultipleReaders', () {
    final DoorSpy doorSpy = DoorSpy();
    final FakeReader fakeReader1 = FakeReader([doorSpy]);
    final FakeReader fakeReader2 = FakeReader([doorSpy]);

    fakeReader2.emulateBadgeDetection();

    EngineManager.callReaders([fakeReader1, fakeReader2]);

    expect(doorSpy.isOpenRequested(), true);
  });

  // This test emulate a use case with two fakes readers and two doors spy.
  // We are emulating a door opening (door 2), and we are checking if the door 1 is not opened.
  test('MultipleReadersAndMultipleDoors', () {
    final DoorSpy doorSpy1 = DoorSpy();
    final DoorSpy doorSpy2 = DoorSpy();
    final FakeReader fakeReader1 = FakeReader([doorSpy1]);
    final FakeReader fakeReader2 = FakeReader([doorSpy2]);

    fakeReader2.emulateBadgeDetection();

    EngineManager.callReaders([fakeReader1, fakeReader2]);

    expect(doorSpy1.isOpenRequested(), false);
    expect(doorSpy2.isOpenRequested(), true);
  });
}
