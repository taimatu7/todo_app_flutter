import 'package:flutter/material.dart';
import 'package:todo_app_flutter/database/todo_dao.dart';
import 'package:todo_app_flutter/models/todo.dart';

/// todoリストウェジェット
class TodoList extends StatefulWidget {
  final Function showDeleteDialog;
  final Function showEditDialog;

  const TodoList(
      {Key? key, required this.showDeleteDialog, required this.showEditDialog})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  TodoListState createState() => TodoListState(
      showDeleteDialog: showDeleteDialog, showEditDialog: showEditDialog);
}

class TodoListState extends State<TodoList> {
  final Function showDeleteDialog;
  final Function showEditDialog;
  late final TodoDao todoDao;
  List<Todo> todos = [];

  @override
  initState() {
    super.initState();
    todoDao = TodoDao();

    todoDao.getTodos().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  TodoListState(
      {Key? key, required this.showDeleteDialog, required this.showEditDialog});

  void getTodos() async {
    final todos = await todoDao.getTodos();
    setState(() {
      this.todos = todos;
    });
  }

  void updateTodo(todo) async {
    await todoDao.addOrUpdateTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                tileColor: todos[index].isDone == 1
                    ? Colors.grey[300]
                    : Colors.blue[50],
                leading: Checkbox(
                    value: todos[index].isDone == 1,
                    onChanged: (bool? value) async {
                      setState(() {
                        todos[index] =
                            todos[index].copyWith(isDone: value! ? 1 : 0);
                      });
                      updateTodo(todos[index]);
                    }),
                title: Text(todos[index].title),
                subtitle: Text(todos[index].content),
                trailing: Wrap(children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showEditDialog(todos[index]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDeleteDialog(todos[index].id);
                    },
                  ),
                ]),
              ),
            ));
  }
}
