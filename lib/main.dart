import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';
import 'package:todo_app/task_manager.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TodoApp()));
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();

}

class _TodoAppState extends State<TodoApp> {
  final TaskManager manager = TaskManager();
  List<Task> tasks = [];
  final TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final loaded = await manager.loadTasks();
    setState(() => tasks = loaded);
  }

  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) return;
    setState(() => tasks.add(Task(id: 'id', title: title)));
    await manager.saveTasks(tasks);
    _controller.clear();
  }

  Future<void> toggleTask(int index) async {
    setState(() => tasks[index].isDone = !tasks[index].isDone);
    await manager.saveTasks(tasks);
  }

  Future<void> deleteTask(int index) async {
    setState(() => tasks.removeAt(index));
    await manager.saveTasks(tasks);
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
              onPressed: () => addTask(_controller.text),
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
                itemBuilder: (context, index) => ListTile(
                  leading: Checkbox(
                    value: tasks[index].isDone, 
                    onChanged: (_) => toggleTask(index)
                    ),
                    title: Text(
                      tasks[index].title,
                      style: TextStyle(
                        decoration: tasks[index].isDone
                        ? TextDecoration.lineThrough 
                        : null,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteTask(index), 
                      icon: const Icon(Icons.delete)),
                )),)
          ],
        ),
      ),
      ),
    );
  }
}

  



