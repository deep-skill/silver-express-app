import 'package:go_router/go_router.dart';
import '../Screens/HomeScreen/home_screen.dart';
import '../Screens/LandingScreen/landing_screen.dart';

class AppRouter {
  final Future<void> Function()? login;

  AppRouter({this.login});

  GoRouter appRouter() {
    return GoRouter(initialLocation: '/', routes: [
      GoRoute(
        name: 'landing',
        path: '/',
        builder: (context, state) => LandingScreen(login: login),
      ),
      GoRoute(
        name: 'principal',
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ]);
  }
}
