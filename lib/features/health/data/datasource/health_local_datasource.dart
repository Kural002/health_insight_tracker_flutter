import 'package:hive/hive.dart';
import '../models/health_entry_model.dart';

class HealthLocalDataSource {
  final Box<HealthEntryModel> box = Hive.box<HealthEntryModel>('healthBox');

  List<HealthEntryModel> getEntries() {
    return box.values.toList();
  }

  Future<void> addEntry(HealthEntryModel entry) async {
    await box.add(entry);
  }
}
