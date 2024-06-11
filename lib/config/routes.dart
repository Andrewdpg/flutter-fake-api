import 'package:flutter/cupertino.dart';
import 'package:new_app/pages/home_page.dart';

PageRouteBuilder appRoutes(RouteSettings settings) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, _, __) {
      switch (settings.name) {
        case "/":
          return const HomePage(category: '');
        case "/men":
          return const HomePage(category: 'men');
        case "/women":
          return const HomePage(category: 'women');
        case "/electronics":
          return const HomePage(category: 'electronics');
        case "/jewelery":
          return const HomePage(category: 'jewelery');
      }
      // Return a default page
      return Container();
    },
    transitionDuration: Duration.zero, // No transition
  );
}
