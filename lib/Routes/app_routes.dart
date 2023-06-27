import 'package:go_router/go_router.dart';
import 'package:silver/Screens/UserScreen/Driver/driver_create_screen.dart';
import '../Screens/HomeScreen/home_screen.dart';
import '../Screens/LandingScreen/landing_screen.dart';
import '../Screens/UserScreen/Client/client_create_screen.dart';
import '../Screens/UserScreen/Client/client_screen.dart';
import '../Screens/UserScreen/Driver/driver_screen.dart';
import '../Screens/UserScreen/type_user_screen.dart';

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
      
      GoRoute(
        name: 'clientes',
        path: '/clientes',
        builder: (context, state) => const ClientScreen(),
      ),
      GoRoute(
        name: 'crearClientes',
        path: '/crearClientes',
        builder: (context, state) => const ClientCreate(),
      ),
      GoRoute(
        name: 'conductores',
        path: '/conductores',
        builder: (context, state) => const DriverScreen(),
      ),
      GoRoute(
        name: 'crearConductores',
        path: '/crearConductores',
        builder: (context, state) => const DriverCreate(),
      ),
    ]);
  }

}