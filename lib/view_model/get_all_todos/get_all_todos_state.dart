part of 'get_all_todos_bloc.dart';

class TodosState extends Equatable {
  final List<GetAllResponse> allTodos;
  final BlocState blocState;


  const TodosState({
    this.blocState =  BlocState.initial,
    this.allTodos = const <GetAllResponse>[],
  });

  Map<String, dynamic> toMap() {
    return {
      'allResponse': allTodos.map((e) => e.toJson()).toList(),
    };
  }

  factory TodosState.fromMap(Map<String, dynamic> map) {
    return TodosState(
      allTodos: List<GetAllResponse>.from(
          map['allResponse']?.map((e) => GetAllResponse.fromJson(e))),
    );
  }

  @override
  List<Object> get props => [allTodos];
}
