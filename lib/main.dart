import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'screens/wizard_one.dart';
import 'screens/wizard_two.dart';
import 'screens/wizard_three.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Wizard App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const WizardOne(),
          '/wizard2': (context) => const WizardTwo(),
          '/wizard3': (context) => WizardThree(),
        },
      ),
    );
  }
}
