part of 'get_all_todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class GetAllTodosEvent extends TodosEvent {
  @override
  List<Object?> get props => [];
}
class PushOnePostEvent extends TodosEvent {
  final String title;
  final String body;
  final int userId;

  const PushOnePostEvent({required this.title,required this.body,required this.userId});

  @override
  List<Object?> get props => [];
}
