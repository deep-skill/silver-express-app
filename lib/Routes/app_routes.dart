import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:silver/Screens/UserScreen/Driver/driver_create_screen.dart';

import '../Screens/UserScreen/Client/client_create_screen.dart';
import '../Screens/UserScreen/Client/client_screen.dart';
import '../Screens/screens.dart';

// * Usamos un Provider para agregar las rutas de todas las apps
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: 'landing',
      path: '/',
      builder: (context, state) => const LandingScreen(),
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
});
