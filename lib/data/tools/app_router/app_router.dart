import 'package:architecture/views/pages/home/home_page.dart';
import 'package:architecture/views/pages/push_post_page/push_post_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.id:
        return MaterialPageRoute(builder: (_) =>  HomePage());
      case PushPostPage.id:
        return MaterialPageRoute(builder: (_) => const PushPostPage());
      default: return null;
    }
  }
}