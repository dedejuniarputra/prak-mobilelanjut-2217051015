// lib/screens/signup_screen.dart

import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import untuk menggunakan JustduitLogo & route

class SignupScreen extends StatefulWidget {
  // Nama rute untuk navigasi
  static const String route = '/signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers untuk setiap input field
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Dispose semua controller untuk mencegah memory leaks
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // --- Helper Methods untuk membangun UI ---

    // Komponen untuk label dengan tanda bintang merah
    Widget requiredLabel(String text) {
      return Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            '*',
            style: TextStyle(color: Colors.red),
          ),
        ],
      );
    }

    // Tombol utama dengan gradient dan shadow
    Widget primaryButton({required String label, required VoidCallback onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: [Color(0xFF1E88FF), Color(0xFF287DFF)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1E88FF).withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    // --- Tampilan Utama Scaffold ---
    
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const JustduitLogo(),
                const SizedBox(height: 24.0),
                const Text(
                  'Sign Up Now and Unlock the\nPower of Justduit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24.0),

                // Form Container
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Full Name
                      requiredLabel('Full Name'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(hintText: 'Enter your full name'),
                      ),
                      const SizedBox(height: 16.0),

                      // Email
                      requiredLabel('Email Address'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(hintText: 'Enter your email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16.0),

                      // Password
                      requiredLabel('Password'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(hintText: 'Create a password'),
                      ),
                      const SizedBox(height: 16.0),

                      // Confirm Password
                      requiredLabel('Confirm Password'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(hintText: 'Re-enter your password'),
                      ),
                      const SizedBox(height: 24.0),
                      
                      // Tombol Continue
                      primaryButton(
                        label: 'Continue',
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginScreen.route,
                            (route) => false,
                          );
                          // TODO: Implementasi logika sign up
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),

                // Link Sign In
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}