import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

import 'Routes/app_routes.dart';
import 'Theme/app_theme.dart';

class MyApp extends StatefulWidget {
  final Auth0? auth0;
  const MyApp({this.auth0, final Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
/*   static void login(BuildContext context) {
    final state = context.findAncestorStateOfType<_MyAppState>();
    state?.login();
  } */
}

class _MyAppState extends State<MyApp> {
  UserProfile? _user;
  final _dio = Dio();

  late Auth0 auth0;
  late Auth0Web auth0Web;

  @override
  void initState() {
    super.initState();
    auth0 = widget.auth0 ??
        Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    auth0Web =
        Auth0Web(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);

    if (kIsWeb) {
      auth0Web.onLoad().then((final credentials) => setState(() {
            _user = credentials?.user;
          }));
    }
  }

  Future<void> login() async {
    try {
      if (kIsWeb) {
        return auth0Web.loginWithRedirect(redirectUrl: 'http://localhost:3000');
      }
      var credentials = await auth0
          .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
          .login();
      print('Print 54: ${_user?.email}');
      /*    final String id = credentials.user.sub;
         final String? email = credentials.user.email;
         final String? name = credentials.user.name;
         const String endpoint = 'http://localhost:7209/auth';
          await _dio.post(endpoint,
             data: {id: id, name: name, email: email},
             options: Options(contentType: 'application/json')); */
      //context.push('/home');
      setState(() {
        _user = credentials.user;
      });
      print('Print 66: ${_user?.email}');
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: 'http://localhost:3000');
      } else {
        await auth0
            .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
            .logout();
        print('Print 80: ${_user?.email}');

        setState(() {
          _user = null;
        });
        print('Print 85: ${_user?.email}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme:
            AppTheme(selectedColor: 1, brightness: Brightness.dark).getTheme(),
        routerConfig: AppRouter(login: login, logout: logout).appRouter());
  }
}
