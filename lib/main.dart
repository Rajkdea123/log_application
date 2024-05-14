import 'package:flutter/material.dart';
import 'package:log_application/data/log_service.dart';
import 'package:log_application/ui/home_page.dart';


void main() async {
  // Load configuration for log file mappings (replace with your actual logic)
  final logFileConfig = const {
    'log1.log': 'source1',
    'log2.log': 'source2',
    // ... Add more configurations as needed
  };
  await LogService.initialize(logFileConfig);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
