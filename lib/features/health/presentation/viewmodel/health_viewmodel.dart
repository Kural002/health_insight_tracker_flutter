import 'package:flutter/material.dart';
import '../../data/models/health_entry_model.dart';
import '../../domain/repository/health_repository.dart';

class HealthViewModel extends ChangeNotifier {
  final HealthRepository _repository = HealthRepository();

  List<HealthEntryModel> _entries = [];

  List<HealthEntryModel> get entries => _entries;

  HealthViewModel() {
    loadEntries();
  }

  void loadEntries() {
    _entries = _repository.getEntries();
    _entries.sort((a, b) => b.date.compareTo(a.date));
    notifyListeners();
  }

  bool isEntryExistsToday() {
    final today = DateTime.now();
    return _entries.any(
      (e) =>
          e.date.year == today.year &&
          e.date.month == today.month &&
          e.date.day == today.day,
    );
  }

  Future<void> addEntry(
    String mood,
    double sleep,
    double water,
    String? note,
  ) async {
    final entry = HealthEntryModel(
      date: DateTime.now(),
      mood: mood,
      sleepHours: sleep,
      waterIntake: water,
      note: note,
    );

    await _repository.addEntry(entry);
    loadEntries();
  }

  double get averageSleep {
    if (_entries.isEmpty) return 0;
    final last7 = _entries.take(7);
    return last7.fold(0.0, (sum, e) => sum + e.sleepHours) / last7.length;
  }

  double get averageWater {
    if (_entries.isEmpty) return 0;
    final last7 = _entries.take(7);
    return last7.fold(0.0, (sum, e) => sum + e.waterIntake) / last7.length;
  }
}
