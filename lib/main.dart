import 'package:flutter/material.dart';
import 'package:sport_app_example/router/app_router.gr.dart';
import 'package:sport_app_example/utilities/get_it_registry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItRegistry.registerStore();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
