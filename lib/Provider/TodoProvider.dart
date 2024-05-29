import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<String> todos = [
    "Make home work",
    "Go to School",
    "Go to Shoping",
  ];

  void addTodo(String title) {
    todos.add(title);
    notifyListeners();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
