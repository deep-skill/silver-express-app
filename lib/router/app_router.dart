import 'package:go_router/go_router.dart';
import 'package:silver_express_app/Screens/LandingScreen/landing_screen.dart';
import 'package:silver_express_app/Screens/PrincipalScreen/principal_screen.dart';
import 'package:silver_express_app/my_app.dart';

class AppRouter {

  final Future<void> Function()? login;

  AppRouter({required this.login});

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
        builder: (context, state) => const PrincipalScreen(),
      ),
    ]);
  }

}