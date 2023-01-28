import 'package:architecture/data/tools/enums/bloc_state_enum.dart';
import 'package:architecture/data/tools/strings/strings.dart';
import 'package:architecture/domain/entity/get_all/get_all_model.dart';
import 'package:architecture/view_model/get_all_todos/get_all_todos_bloc.dart';
import 'package:architecture/views/pages/push_post_page/push_post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.homePage)
      ),
      body: BlocBuilder<GetAllTodosBloc, TodosState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (state.blocState == BlocState.loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                    itemCount: state.allTodos.length,
                    itemBuilder: (context, index) {
                      GetAllResponse response = state.allTodos[index];
                      return Card(
                        child: ListTile(
                          title: Text('${response.title}'),
                          subtitle: Text('${response.id}'),
                        ),
                      );
                    }),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(PushPostPage.id);
        },
      ),
    );
  }
}
