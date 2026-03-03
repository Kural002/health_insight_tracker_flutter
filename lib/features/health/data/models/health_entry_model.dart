import 'package:hive/hive.dart';
part 'health_entry_model.g.dart';

@HiveType(typeId: 0)
class HealthEntryModel extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final String mood;

  @HiveField(2)
  final double sleepHours;

  @HiveField(3)
  final double waterIntake;

  @HiveField(4)
  final String? note;

  HealthEntryModel({
    required this.date,
    required this.mood,
    required this.sleepHours,
    required this.waterIntake,
    this.note,
  });

  get month => null;
}
