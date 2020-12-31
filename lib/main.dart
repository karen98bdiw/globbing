import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/logScreens/introducingScreen.dart';
import './screens/logScreens/logInScreen.dart';
import './screens/logScreens/registerScreens/registerScreen.dart';
import './screens/mainScreens/mainScreensRoot.dart';
import './screens/logScreens/registerScreens/registerStep2.dart';
import './screens/mainScreens/addOrderScreen.dart';
import 'providers/languageState.dart';

import './screens/mainScreens/menuScreen.dart';
import './providers/userStateProvider.dart';
import 'package:firebase_core/firebase_core.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp()
      .then((value) => print("initialize OK!"))
      .catchError((e) {
    print(e);
  });
  runApp(GlobbingApp());
}

class GlobbingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageItems(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserStateProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: IntroducingScreen.routeName,
        routes: {
          IntroducingScreen.routeName: (ctx) => IntroducingScreen(),
          LogInScreen.routeName: (ctx) => LogInScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          MainScreensRoot.routeName: (ctx) => MainScreensRoot(),
          MenuScreen.routeName: (ctx) => MenuScreen(),
          RegisterStep2.routeName: (ctx) => RegisterStep2(),
          AddOrderScreen.routeName: (ctx) => AddOrderScreen(),
        },
      ),
    );
  }
}
