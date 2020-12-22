import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/logScreens/introducingScreen.dart';
import './screens/logScreens/logInScreen.dart';
import 'screens/logScreens/registerScreens/registerScreen.dart';
import './utils/languageState.dart';

main() => runApp(GlobbingApp());

class GlobbingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageItems(),
        ),
      ],
      child: MaterialApp(
        initialRoute: IntroducingScreen.routeName,
        routes: {
          IntroducingScreen.routeName: (ctx) => IntroducingScreen(),
          LogInScreen.routeName: (ctx) => LogInScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
        },
      ),
    );
  }
}
