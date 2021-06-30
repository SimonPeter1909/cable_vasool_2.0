import 'package:cable_vasool/hive_helper/hive_helper.dart';
import 'package:cable_vasool/pages/splash_screen/splash_screen.dart';
import 'package:cable_vasool/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'pages/login_page/login_provider.dart';
import 'pages/splash_screen/splash_screen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Firebase.initializeApp();

  await Hive.openBox(HiveHelper.headerBox);

  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashScreenProvider>(
            create: (context) => SplashScreenProvider()),
        ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider()),
      ],
      child: MaterialApp.router(
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
        title: 'Cable Vasool',
        // darkTheme: ThemeData.dark(),
        // themeMode: ThemeMode.dark,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          primarySwatch: Colors.blue,
        ),
        // home: SplashScreen(),
      ),
    );
  }
}
