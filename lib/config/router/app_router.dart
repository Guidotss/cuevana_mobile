
import 'package:go_router/go_router.dart';
import 'package:guivana/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/', 
      builder: (context, state) => const HomeScreen(),
      name: HomeScreen.name
    ),
  ],
);