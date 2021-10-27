import 'dart:js';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:itelective61/screens/home_ui.dart';
import 'package:itelective61/screens/login_ui.dart';
import 'package:itelective61/shared/firebase_authentication.dart';
import 'package:itelective61/shared/reg_users.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      Provider(
        create: (_) => Firebase_Authentication(),
      ),
      StreamProvider(
        initialData: RegUsers(),
        create: (context) => context.read<Firebase_Authentication>().getUser,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Consumer<RegUsers>(builder: (context, user, __) {
        if (user.uid == "") {
          return const LoginView();
        } else {
          return const HomeScreen();
        }
      }),
    );
  }
}
