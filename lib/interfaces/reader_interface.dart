import 'package:cdc/interfaces/door_interface.dart';

abstract class IReader {
  bool isBadgeDetected();

  List<IDoor> doors();
}
