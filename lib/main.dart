import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Counter model that holds the state and notifies listeners
class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  // Function to increment the counter
  void increment() {
    _counter++;
    notifyListeners();  // Notify listeners about the change
  }

  // Function to decrement the counter
  void decrement() {
    _counter--;
    //notifyListeners();  // Notify listeners about the change
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),  // Provide the CounterModel to the widget tree
      child: MaterialApp(
        title: 'Flutter Counter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 18),
            ),
            // Use Consumer to listen to changes in the CounterModel
            Consumer<CounterModel>(
              builder: (context, counterModel, child) {
                return Text(
                  '${counterModel.counter}', // Display the current counter value
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Increment Button
                ElevatedButton(
                  onPressed: () {
                    // Access CounterModel and increment the counter
                    Provider.of<CounterModel>(context, listen: false).increment();
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                // Decrement Button
                ElevatedButton(
                  onPressed: () {
                    // Access CounterModel and decrement the counter
                    Provider.of<CounterModel>(context, listen: false).decrement();
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
