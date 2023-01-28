// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import 'package:architecture/main.dart';
//
// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     // await tester.pumpWidget(const MyApp());
//
//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();
//
//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }


// final baseProvider = StreamProvider.autoDispose<Stream<CompositeSubscription>>((ref) {
//   bag to handle all the subscriptions scoped to this ViewModel
//   final subscribe = CompositeSubscription();
//   ref.onDispose(() => subscribe.dispose());
//   return subscribe;
// });

// class BaseProvider extends ChangeNotifier {
//   final subscribe = CompositeSubscription();
//
//   @override
//   void dispose() {
//     super.dispose();
//     subscribe.dispose();
//   }
// }

// import 'package:architecture/controller/base/base_provider.dart';
// import 'package:architecture/data/tools/log_service.dart';
// import 'package:architecture/domain/entity/get_all/get_all_model.dart';
// import 'package:architecture/domain/use_case/get_all_use_case/get_all_use_case.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:rxdart/rxdart.dart';
//
// class HomeProvider extends BaseProvider {
//   GetAllUseCase getAllUseCase;
//   GetAllResponse? response;
//   bool isLoading = false;
//   HomeProvider(this.getAllUseCase);
//   void getAllTodos(){
//     getAllUseCase.invoke().listen((event) {
//          event.when(loading: (){
//            isLoading = true;
//            notifyListeners();
//          }, content: (value){
//            response = value;
//            notifyListeners();
//             LogService.d(value.toString());
//          }, error: (errorMessage){
//            LogService.d('$errorMessage');
//
//          });
//     })..onDone(() {
//       isLoading = false;
//       notifyListeners();
//     })..addTo(subscribe);
//   }
// }
// final postCommentsProvider = ChangeNotifierProvider((ref) => HomeProvider())

