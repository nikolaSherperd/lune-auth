import 'package:flutter/material.dart';

void main() => runApp(const LuneApp());

const bronze = Color(0xFFB08D57);
const black = Color(0xFF101010);

class LuneApp extends StatelessWidget {
  const LuneApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: black,
      colorScheme: ColorScheme.fromSeed(
        seedColor: bronze,
        brightness: Brightness.dark,
      ),
    ),
    home: const AuthScreen(),
  );
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool register = false;
  final form = GlobalKey<FormState>();
  final password = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/company_logo.jpg', height: 65),
              const SizedBox(height: 12),
              const Text(
                'L U N E',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 5,
                  color: bronze,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                register ? 'Create Account' : 'Welcome Back',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(height: 30),

              if (register) ...[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 18),
              ],

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email Address'),
                validator: (v) =>
                    v == null || !v.contains('@') ? 'Invalid email' : null,
              ),
              const SizedBox(height: 18),

              TextFormField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (v) =>
                    v == null || v.length < 6 ? 'Minimum 6 characters' : null,
              ),

              if (register) ...[
                const SizedBox(height: 18),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  validator: (v) =>
                      v != password.text ? 'Passwords do not match' : null,
                ),
              ],

              const SizedBox(height: 30),

              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: bronze,
                  foregroundColor: black,
                  padding: const EdgeInsets.all(17),
                ),
                onPressed: () {
                  if (form.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form validated')),
                    );
                  }
                },
                child: Text(register ? 'REGISTER' : 'LOGIN'),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () => setState(() => register = !register),
                child: Text(
                  register
                      ? 'Already registered? Login'
                      : "Don't have an account? Register",
                  style: const TextStyle(color: bronze),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
