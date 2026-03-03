import 'package:health_insight_tracker/features/health/data/datasource/health_local_datasource.dart';
import 'package:health_insight_tracker/features/health/data/models/health_entry_model.dart';

class HealthRepository {
  final HealthLocalDataSource dataSource = HealthLocalDataSource();

  List<HealthEntryModel> getEntries() {
    return dataSource.getEntries();
  }

  Future<void> addEntry(HealthEntryModel entry) async {
    await dataSource.addEntry(entry);
  }
}
