import 'package:cdc/interfaces/door_interface.dart';
import 'package:cdc/interfaces/reader_interface.dart';
import 'package:cdc/models/badge_model.dart';

class FakeReader implements IReader {
  late final List<IDoor> _doors;
  bool _isBadgeDetected = false;

  FakeReader(this._doors);

  void emulateBadgeDetection(Badge badge) {
    _isBadgeDetected = !badge.isRestricted;
  }

  @override
  List<IDoor> doors() {
    return _doors;
  }

  @override
  bool isBadgeDetected() {
    return _isBadgeDetected;
  }
}
