import 'package:architecture/injection.dart';
import 'package:architecture/view_model/get_all_todos/get_all_todos_bloc.dart';
import 'package:architecture/views/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'data/storage/auth/auth_prefs.dart';
import 'data/tools/app_router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Hive.initFlutter();
  await Hive.openBox(AuthPrefs.authBoxID);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final GetAllTodosBloc bloc = getIt<GetAllTodosBloc>();

    return BlocProvider(
      create: (context) => bloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
        onGenerateRoute: appRouter.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
