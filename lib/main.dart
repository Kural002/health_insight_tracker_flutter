import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'features/health/presentation/viewmodel/health_viewmodel.dart';
import 'features/health/presentation/screens/home_screen.dart';
import 'features/health/data/models/health_entry_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HealthEntryModelAdapter());
  await Hive.openBox<HealthEntryModel>('healthBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HealthViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health Insight Tracker',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const HomeScreen(),
      ),
    );
  }
}
