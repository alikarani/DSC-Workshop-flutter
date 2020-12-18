import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TODO APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title;
  String text;
  List _todos = [];

  addTodo() {
    List tempTodos = _todos;
    tempTodos.add({'title': text});
    setState(() {
      _todos = tempTodos;
    });
    print(tempTodos);
  }

  deleteTodo(index) {
    List tempTodos = _todos;
    tempTodos.removeAt(index);
    setState(() {
      _todos = tempTodos;
    });
    print(tempTodos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 260,
                  child: TextField(
                    onChanged: (value) => text = value,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Add todo's"),
                  ),
                ),
                RaisedButton(
                  onPressed: () => addTodo(),
                  child: Text(
                    "Add todo",
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            child: Center(child: Text(_todos[index]['title'])),
                          ),
                          RaisedButton(
                            onPressed: () => deleteTodo(index),
                            child: Text(
                              "delete",
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ),
            Text('Made by Ali Karani')
          ],
        ),
      ),
    );
  }
}
