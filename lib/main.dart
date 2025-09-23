import 'package:flutter/material.dart';
import 'package:myapp/Screens/login_screen.dart';
import 'package:myapp/Screens/signup_screen.dart';
import 'package:myapp/Screens/dashboard_screen.dart';

void main() => runApp(const JustduitApp());

class JustduitApp extends StatelessWidget {
  const JustduitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Justduit',
      theme: ThemeData(
        // Tema yang Anda buat sudah bagus, tidak perlu diubah
        scaffoldBackgroundColor: const Color(0xFFF8F8FB), // abu-abu muda
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E88FF)),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFEDEBEB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFEDEBEB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF1E88FF)),
          ),
        ),
      ),
      // Atur rute awal
      initialRoute: LoginScreen.route,
      // Definisikan semua rute aplikasi Anda di sini
      routes: {
        LoginScreen.route: (context) => const LoginScreen(),
        SignupScreen.route: (context) => const SignupScreen(),
        DashboardScreen.route: (context) => const DashboardScreen(),
      },
    );
  }
}