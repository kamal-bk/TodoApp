import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<String> todos = [];
TextEditingController _controllerTodo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _controllerTodo,
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  todos.add(_controllerTodo.text);
                  _controllerTodo.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
      }, child: Icon(Icons.add),),
      body: todos.isEmpty? Center(child: Text("No Item Found"),): ListView.builder(
        itemCount: todos.length,
        itemBuilder: (ctx, ind){
          return  ListTile(
            title: Text(todos[ind]),
            subtitle: Text("Todo Items"),
            leading: Icon(Icons.info),
            trailing: GestureDetector(
              onTap: (){
                setState(() {
                  todos.removeAt(ind);                });
              },
              child: Icon(Icons.delete)),
          );
        })
    );
  }
}
