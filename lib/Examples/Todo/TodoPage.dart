import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Examples/Counter/CounterPage.dart';
import 'package:provider_learn/Examples/Slider/SliderExample.dart';
import 'package:provider_learn/Provider/TodoProvider.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TodoProvider todoProvider =
        Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            const Icon(
              Icons.heart_broken_rounded,
              size: 60,
              color: Colors.deepPurple,
            ),
            const Text(
              "TODO Example",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: title,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Enter Todo",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (title.text.isNotEmpty) {
                      todoProvider.addTodo(title.text);
                      title.clear();
                    }
                  },
                  icon: const Icon(
                    Icons.check_circle,
                    size: 45,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: Consumer<TodoProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.todos.length,
                    clipBehavior: Clip.antiAlias,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          onTap: () {
                            print(index);
                          },
                          splashColor: Colors.deepPurple.shade400,
                          tileColor: Colors.white,
                          leading: const Icon(Icons.check_box),
                          trailing: InkWell(
                            onTap: () {
                              todoProvider.deleteTodo(index);
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.deepOrange,
                            ),
                          ),
                          title: Text(value.todos[index]),
                        ),
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
