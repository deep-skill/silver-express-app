import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:silver/Screens/UserScreen/Driver/driver_create_screen.dart';

import '../Screens/UserScreen/Client/client_create_screen.dart';
import '../Screens/UserScreen/Client/client_screen.dart';
import '../Screens/screens.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: 'landing',
      path: '/',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'clients',
      path: '/clients',
      builder: (context, state) => const ClientScreen(),
    ),
    GoRoute(
      name: 'createClient',
      path: '/createClient',
      builder: (context, state) => const ClientCreate(),
    ),
    GoRoute(
      name: 'drivers',
      path: '/drivers',
      builder: (context, state) => const DriverScreen(),
    ),
    GoRoute(
      name: 'createDriver',
      path: '/createDriver',
      builder: (context, state) => const DriverCreate(),
    ),
  ]);
});
