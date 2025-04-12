import 'package:flutter/material.dart';
import 'package:macare/screens/auth/Responsivehomescreen.dart';
import 'package:macare/screens/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEELZON',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}



class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const ResponsiveHomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginRegistrationPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

// In screens/home/home_page.dart
// Include the ResponsiveHomePage code here

// In screens/auth/login_registration_screen.dart
// Include the LoginRegistrationScreen code here