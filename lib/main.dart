import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/initial_screen.dart';
import 'providers/progress_provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ProgressProvider(), child: MaterialApp(
      title: 'ChiCross',
      home:  InitialScreen(),)
    );
  }
}

