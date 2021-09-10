import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 0; // đây là data sẽ được truyền xuống widget con

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // truyền data `counter` từ widget MyHomePage xuống MyCenterWidget
      body: MyCenterWidget(counter: counter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key? key,
    @required this.counter,
  }) : super(key: key);

  // data này vô nghĩa vì đúng bản chất thì MyCenterWidget ko cần nó
  final int? counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      // tiếp tục truyền data từ widget MyCenterWidget xuống MyText
      child: MyText(counter: counter),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key, @required this.counter}) : super(key: key);

  // chỉ có MyText mới thật sự cần data này
  final int? counter;

  @override
  Widget build(BuildContext context) {
    return Text('Tui là widget Text. Data của tui hiện tại là: $counter');
  }
}
