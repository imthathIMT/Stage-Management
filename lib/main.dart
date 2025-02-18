import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Initial theme mode is light
  bool _isDarkMode = false;

  // Function to toggle theme
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the theme based on the _isDarkMode value
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
        buttonTheme: const ButtonThemeData(buttonColor: Colors.amber),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Toggle App'),
          actions: [
            // Button to toggle theme
            IconButton(
              icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
              onPressed: _toggleTheme,
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current Theme: ${_isDarkMode ? "Dark" : "Light"}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              // 
              IconButton(
              icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
              onPressed: _toggleTheme,
            )
            ],
          ),
        ),
      ),
    );
  }
}
