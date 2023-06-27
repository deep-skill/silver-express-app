import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silver/Providers/theme_providers.dart';
import 'package:silver/theme/app_theme.dart';
import 'Routes/app_routes.dart';

class MyApp extends ConsumerStatefulWidget {
  final Auth0? auth0;
  const MyApp({this.auth0, final Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();

  static void login(BuildContext context) {
    final state = context.findAncestorStateOfType<MyAppState>();
    state?.login();
  }
}

class MyAppState extends ConsumerState<MyApp> {
  // ignore: unused_field
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
        await auth0Web.loginWithRedirect(redirectUrl: 'http://localhost:3000');
      } else {
        var credentials = await auth0
            .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
            .login();

        final String id = credentials.user.sub;
        final String? email = credentials.user.email;
        final String? name = credentials.user.name;

        const String endpoint = 'http://localhost:7209/auth';

        await _dio.post(endpoint,
            data: {id: id, name: name, email: email},
            options: Options(contentType: 'application/json'));

        // ignore: use_build_context_synchronously
        context.push('/home');

        setState(() {
          _user = credentials.user;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
        setState(() {
          _user = null;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    final AppTheme appTheme = ref.watch(themeProvider);

    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme.getTheme(),
        routerConfig: AppRouter(login: login).appRouter());
  }
}
