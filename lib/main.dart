import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';
import 'package:todo_app/taskTitle.dart';

void main() {
  runApp(TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageScreenState createState() => _MyHomePageScreenState();
  const MyHomePage({super.key});

}

class _MyHomePageScreenState extends State<MyHomePage> {
  List<Task> tasks = [];
  final TextEditingController _controller = TextEditingController();


  void addTask() {
    final task = _controller.text.trim();
    if (task.isNotEmpty) {
      setState(() {
        tasks.add(Task(task, false));
      });
      _controller.clear();
    }  
}

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.all(60.0),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20.0,
          children: <Widget>[
            Text(
              'TODO APP',
              style: TextStyle(color: const Color.fromARGB(255, 192, 76, 115), fontSize: 24, ),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 30.0,
              children: [
                SizedBox(
                  width: 200,
              child: TextField(
              controller: _controller,
              autofocus: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 158, 190),
                  )
                ),
                hintText: 'Enter Something',
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 221, 221)
              ),
            )
            ),

            

          
            ElevatedButton(
              onPressed: addTask,
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 187, 187),
              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Button padding
            textStyle: const TextStyle(fontSize: 16, color: Colors.black), // Text style
            ),
              child: Text('Add')
            )
            
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(task: tasks[index]);
                }),)
          ],
        ),
      ),
      ),
    );
  }
}
