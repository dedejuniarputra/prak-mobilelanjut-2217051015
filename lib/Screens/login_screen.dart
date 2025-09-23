import 'package:flutter/material.dart';
import 'package:myapp/Screens/dashboard_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  // Nama rute untuk navigasi
  static const String route = '/';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk mengambil data dari Text Field
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Pastikan untuk melepaskan controller saat widget tidak digunakan
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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

    // Komponen tombol biru utama
    Widget primaryButton({required String label, required VoidCallback onTap}) {
      return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E88FF), // WARNA BARU
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(label, style: const TextStyle(fontSize: 16)),
      );
    }

    // --- Tampilan Utama Scaffold ---

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const JustduitLogo(),
              const SizedBox(height: 60.0),
              const Text(
                'Hi, Welcome Back to Justduit',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32.0),

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
                decoration: const InputDecoration(hintText: 'Enter your password'),
              ),
              const SizedBox(height: 8.0),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password'),
                ),
              ),
              const SizedBox(height: 24.0),

              // Tombol Sign In menggunakan helper method
              // ...
              primaryButton(
                label: 'Sign In Now',
                onTap: () {
                  // Cek apakah email atau password kosong
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    // Jika ya, tampilkan notifikasi error
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email dan Password tidak boleh kosong!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Jika tidak, lanjutkan ke dashboard
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      DashboardScreen.route,
                      (route) => false,
                    );
                  }
                },
              ),
// ...
              const SizedBox(height: 24.0),
              // Opsi Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.route);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget reusable untuk Logo
class JustduitLogo extends StatelessWidget {
  const JustduitLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'Assets/JustDuit.png', // Pastikan path ini benar
          height: 55,
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}