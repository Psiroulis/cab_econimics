import 'package:cab_economics/repositories/firebase.dart';
import 'package:cab_economics/screrens/calendar_screen.dart';
import 'package:cab_economics/screrens/ride_providers_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => FirebaseRepository(),
                ),
              ],
              child: const MyApp(),
            ),
          ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RideProvidersScreen.routeName,
      routes: {
        CalendarScreen.routeName: (ctx) => const CalendarScreen(),
        RideProvidersScreen.routeName: (ctx) => const RideProvidersScreen(),
      },
    );
  }
}
