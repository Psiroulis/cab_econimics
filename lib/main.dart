import 'package:cab_economics/features/skeleton/providers/selected_page_provider.dart';
import 'package:cab_economics/features/skeleton/skeleton.dart';
import 'package:cab_economics/screrens/calendar_screen.dart';
import 'package:cab_economics/screrens/ride_providers_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'features/ride_providers/presentation/providers/ride_provider_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (ctx) => SelectedPageProvider(),
                ),
                ChangeNotifierProvider(
                  create: (ctx) => RideProviderProvider(),
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
      initialRoute: Skeleton.routeName,
      routes: {
        CalendarScreen.routeName: (ctx) => const CalendarScreen(),
        RideProvidersScreen.routeName: (ctx) => const RideProvidersScreen(),
        Skeleton.routeName: (ctx) => const Skeleton(),
      },
    );
  }
}
