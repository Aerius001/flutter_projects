import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      // create: (_) => CounterProvider(),
      create: (_) => Settings(),
      child: MaterialApp(
        home: MyApp(),
      ),
    ));

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void add() {
    _counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Provide Flutter'),
            backgroundColor: settings.color,
          ),

          body: Center(
            // child: Text(context.watch<CounterProvider>().counter.toString()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    settings.changeText();
                  },
                  child: Text('Click me to change text (^o^)'),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('${settings.text}'),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    settings.changeColor();
                  },
                  child: Text('Click me to change color (^o^)'),
                ),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   child: Icon(Icons.add),
          //   onPressed: () {
          //     // context.read<CounterProvider>().add();
          //   },
          // ),
        );
      },
    );
  }
}

class Settings extends ChangeNotifier {
  String text = 'OK';
  Color color = Colors.red;

  void changeText() {
    if (text == 'Hello') {
      text = 'World';
    } else
      text = 'Hello';
    notifyListeners();
  }

  void changeColor() {
    if (color == Colors.green) {
      color = Colors.red;
    } else
      color = Colors.green;
    notifyListeners();
  }
}
