import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Global key
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emailField(),
            passwordField(),
            const SizedBox(height: 20),
            submitButton(),
          ],
        ),
      ),
    );
  }

// Fields list
// Email field
  Widget emailField() {
    return TextFormField(
      validator: (value) {
        if (!value!.contains('@')) {
          return 'Invalid email address';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text('Login Email'),
        hintText: 'you@example.com',
      ),
    );
  }

  // Password field
  Widget passwordField() {
    return TextFormField(
      validator: (value) {
        if (value!.length < 4) {
          return 'Invalid Password, must be 4 or more characters';
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        label: Text('Login Password'),
        hintText: 'Your secret password',
      ),
    );
  }

  // Submit button
  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        print(formKey.currentState?.validate());
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50),
      ),
      child: const Text('Submit'),
    );
  }
}
