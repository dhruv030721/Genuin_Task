import 'package:genuin_task/presentation/pages/community_screeen.dart';
import 'package:genuin_task/presentation/pages/home_screen.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),)
  ]
);
