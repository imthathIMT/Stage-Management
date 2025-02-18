import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterScreen(),
    );
  }
}

class  CounterScreen extends StatefulWidget {
  @override
   _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;  // This will hold the counter value

  // Function to increment the counter
  void _incrementCounter() {
    setState(() {
      _counter++;  // Increment the counter value
    });
  }

  // Function to decrement the counter
  void _decrementCounter() {
    setState(() {
      _counter--;  // Decrement the counter value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App',
        style: TextStyle(fontSize: 20, 
          fontWeight: FontWeight.bold, 
          color: Colors.white),
        
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_counter',  // Display the current value of _counter
              style:const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Increment Button
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child:const Text('+', 
                  style: TextStyle(fontSize: 20),
                  ),
                ),
               const SizedBox(width: 20),
                // Decrement Button
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('-'
                  ,style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
