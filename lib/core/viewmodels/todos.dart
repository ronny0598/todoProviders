
import 'package:scoped_model/scoped_model.dart';
import 'package:compound/core/models/to_do.dart';


class Todos extends Model {
  List<ToDo> _todosList = [];
  Set<ToDo> _checkedTodos = Set<ToDo>();

  List<ToDo> get todos => _todosList;

  int get todosCount => _todosList.length;

  void addTodo(ToDo todo, {int position = 0}) {
    _todosList.insert(position, todo);
    notifyListeners();
  }


  void toggleTodo(ToDo todo) {

    removeTodo(todo);

    if (_checkedTodos.contains(todo)) {
      _markTodoAsUnchecked(todo);
    } else {
      _markTodoAsChecked(todo);
    }

    notifyListeners();
  }

  void _markTodoAsChecked(ToDo todo) {
    _todosList.insert(_todosList.length, todo);
    _checkedTodos.add(todo);
  }

  void _markTodoAsUnchecked(ToDo todo) {
    _todosList.insert(0, todo);
    _checkedTodos.remove(todo);
  }

  void removeTodo(ToDo todo) {
    _todosList.remove(todo);
    notifyListeners();
  }

  bool isCheckedTodo(ToDo todo) {
    return _checkedTodos.contains(todo);
  }
}
