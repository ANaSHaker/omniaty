import 'package:flutter/material.dart';

import '../models/post.dart';
import '../screens/add_post.dart';
import '../screens/home.dart';
import '../screens/view_post.dart';
import 'route_constant.dart';
import 'undefined_view.dart';

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.ROOT:
        return MaterialPageRoute(builder: (_) => HomePage());

      case RouteConstant.ADD_POST:
        return MaterialPageRoute(builder: (_) => AddPost());


      case RouteConstant.VIEW_POST:
        Post post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post));


      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
                  routeName: settings.name,
                ));
    }
  }
}
