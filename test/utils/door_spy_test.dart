import 'package:cdc/interfaces/door_interface.dart';

class DoorSpy implements IDoor {
  bool _isOpenRequested = false;

  bool isOpenRequested() {
    return _isOpenRequested;
  }

  @override
  void open() {
    _isOpenRequested = true;
  }
}
