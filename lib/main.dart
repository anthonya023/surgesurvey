import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surgesurvey/core/di/injection.dart';
import 'package:surgesurvey/navigation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup dependency injection
  setupDependencyInjection();

  // Configure status bar
  await _configStatusBar();

  runApp(const MyApp());
}

Future<void> _configStatusBar() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade900,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        title: 'Surge Survey',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
          textTheme:
              GoogleFonts.bebasNeueTextTheme(
                ThemeData.dark().textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
              ).copyWith(
                // Fallback for Android
                bodyLarge: GoogleFonts.bebasNeue(fontSize: 16, color: Colors.white),
                headlineLarge: GoogleFonts.bebasNeue(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
              ),
        ),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              GoogleFonts.bebasNeueTextTheme(
                ThemeData.light().textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black),
              ).copyWith(
                // Fallback for Android
                bodyLarge: GoogleFonts.bebasNeue(fontSize: 16, color: Colors.black),
                headlineLarge: GoogleFonts.bebasNeue(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
              ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        builder: EasyLoading.init(),
      ),
    );
  }
}
