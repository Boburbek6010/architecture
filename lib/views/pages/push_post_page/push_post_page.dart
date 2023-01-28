import 'package:architecture/data/tools/enums/bloc_state_enum.dart';
import 'package:architecture/data/tools/strings/strings.dart';
import 'package:architecture/view_model/get_all_todos/get_all_todos_bloc.dart';
import 'package:architecture/views/pages/push_post_page/widget/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PushPostPage extends HookWidget {
  static const String id = 'push_post_page';

  const PushPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTextController = useTextEditingController();
    final bodyTextController = useTextEditingController();
    final titleTextTerm = useState('');
    final bodyTextTerm = useState('');
    useEffect(() {
      titleTextController.addListener(() {
        titleTextTerm.value = titleTextController.text;
      });
      return () {};
    }, [titleTextController]);
    useEffect(() {
      bodyTextController.addListener(() {
        bodyTextTerm.value = bodyTextController.text;
      });
      return () {};
    }, [bodyTextController]);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(Strings.addPost),
          actions: [
            BlocBuilder<GetAllTodosBloc, TodosState>(
              builder: (context, state) {
                if (titleTextTerm.value.isEmpty || bodyTextTerm.value.isEmpty) {
                  return const SizedBox();
                }
                if(state.blocState == BlocState.loading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return IconButton(
                    onPressed: () {
                      context.read<GetAllTodosBloc>().add(PushOnePostEvent(
                          title: titleTextController.text.trim(),
                          body: bodyTextController.text.trim(),
                          userId: 1));
                           titleTextController.clear();
                           bodyTextController.clear();
                    },
                    icon: const Icon(Icons.add));
              },
            )
          ],
        ),
        body: BlocBuilder<GetAllTodosBloc, TodosState>(
          builder: (context, state) {
            return  Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldCustom(
                      controller: titleTextController, title: Strings.title),
                  const SizedBox(height: 15),
                  TextFieldCustom(
                      controller: bodyTextController, title: Strings.body),
                  const SizedBox(height: 15),
                ],
              ),
            );
          },
        )
    );
  }
}

