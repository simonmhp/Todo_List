import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty!');
      return;
    }
    final todo = Todo(
      name: title,
      createAt: DateTime.now(),
    );

    // // flutter doesnot render the todolist but the state is updated.
    // // because the state is same and emit checks for change in state to be notified to the listeners.
    // state.add(todo);
    // // state.add() should not be used because state should only be modifiable through 'emit' fuction.
    // // since List is mutable class, we were able to modify the values within it.
    // emit(state);
    // // therefore:
    emit([...state, todo]);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('TodoCubit: $error');
  }
}
