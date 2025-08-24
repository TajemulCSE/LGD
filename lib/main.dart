import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lgd/providers/auth_provider.dart';
import 'package:lgd/providers/custom_id_pass_provider.dart';
import 'package:lgd/providers/tournament_provider.dart';
import 'package:lgd/providers/user_provider.dart';
import 'package:lgd/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_)=>TournamentProvider()),
        ChangeNotifierProvider(create: (_)=>CustomIdPassProvider()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}
