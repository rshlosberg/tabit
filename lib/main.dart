import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabit/presentation/character_details_page/widget/character_details_page.dart';
import 'package:tabit/presentation/character_list_page/widget/character_list_page.dart';
import 'package:tabit/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  /// Define the routes of the app.
  static Map<String, Widget Function(dynamic _)> routes = {
    RouteScreens.characterDetailsPage: (_) => const CharacterDetailsPage(),
    RouteScreens.characterListPage: (_) => const CharacterListPage(),
  };

  /// This widget is the root of the app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // Define the initial route.
        initialRoute: RouteScreens.characterListPage,
        onGenerateRoute: (settings) {
          late final PageRouteBuilder route;
          route = PageRouteBuilder(
            settings: settings,
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) =>
                routes[settings.name]!(context),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final mediaQuery = MediaQuery(
                data: MediaQueryData.fromView(View.of(context)).copyWith(
                    gestureSettings:
                        const DeviceGestureSettings(touchSlop: kTouchSlop)),
                child: child,
              );
              return Theme.of(context).pageTransitionsTheme.buildTransitions(
                  route, context, animation, secondaryAnimation, mediaQuery);
            },
          );
          return route;
        });
  }
}
