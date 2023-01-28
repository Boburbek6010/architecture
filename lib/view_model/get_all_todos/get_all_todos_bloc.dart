import 'dart:async';
import 'package:architecture/data/tools/enums/bloc_state_enum.dart';
import 'package:architecture/domain/entity/get_all/get_all_model.dart';
import 'package:architecture/domain/entity/post_request/post_request_model.dart';
import 'package:architecture/domain/use_case/get_all_use_case/get_all_use_case.dart';
import 'package:architecture/domain/use_case/push_post_use_case/push_post_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'get_all_todos_event.dart';

part 'get_all_todos_state.dart';

class GetAllTodosBloc extends HydratedBloc<TodosEvent, TodosState> {
  final GetAllUseCase getAllUseCase;
  final PushPostUseCase pushPostUseCase;

  GetAllTodosBloc({required this.getAllUseCase, required this.pushPostUseCase})
      : super(const TodosState()) {
    on<GetAllTodosEvent>(getAllTodos);
    on<PushOnePostEvent>(pushOnePost);
    add(GetAllTodosEvent());
  }

  Future<void> getAllTodos(
      GetAllTodosEvent event, Emitter<TodosState> emitter) async {
    await emitter.forEach(getAllUseCase.invoke(), onData: (data) {
      return data.when(loading: () {
        return const TodosState(blocState: BlocState.loading);
      }, content: (content) {
        return TodosState(blocState: BlocState.success, allTodos: content);
      }, error: (error) {
        return const TodosState(blocState: BlocState.error);
      });
    });
  }

  Future<void> pushOnePost(PushOnePostEvent event, Emitter<TodosState> emitter) async {
    PostRequest request = PostRequest.fromJson({'title': event.title, 'body': event.body, 'userId': event.userId});
    await emitter.forEach(pushPostUseCase.invoke(request), onData: (data) {
      return data.when(loading: () {
        return const TodosState(blocState: BlocState.loading);
      }, content: (content) {
        return const TodosState(blocState: BlocState.success);
      }, error: (error) {
        return const TodosState(blocState: BlocState.error);
      });
    });
  }

  @override
  TodosState? fromJson(Map<String, dynamic> json) {
    return TodosState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodosState state) {
    return state.toMap();
  }
}
