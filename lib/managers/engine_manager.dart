import 'package:cdc/interfaces/door_interface.dart';
import 'package:cdc/interfaces/engine_interface.dart';
import 'package:cdc/interfaces/reader_interface.dart';

class EngineManager extends IEngine {
  static callReaders(List<IReader> readers) {
    for (final IReader reader in readers) {
      if (reader.isBadgeDetected()) {
        for (final IDoor door in reader.doors()) {
          if (door.isOpenToday) {
            door.open();
          }
        }
      }
    }
  }
}
