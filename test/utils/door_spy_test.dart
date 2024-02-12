import 'package:cdc/interfaces/door_interface.dart';

class DoorSpy implements IDoor {
  bool _isOpenRequested = false;

  @override
  int beginHour;

  @override
  int endHour;

  DoorSpy({
    required this.beginHour,
    required this.endHour,
  });

  bool isOpenRequested() {
    return _isOpenRequested;
  }

  @override
  void open() {
    DateTime now = DateTime.now();
    if (now.hour <= beginHour || now.hour >= endHour) {
      _isOpenRequested = false;
    } else {
      _isOpenRequested = true;
    }
  }
}
