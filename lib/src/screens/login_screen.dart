import 'package:flutter/material.dart';
import 'package:login_statefull/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // Global key
  final formKey = GlobalKey<FormState>();
  // Get Values
  late String email;
  late String password;

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
      onSaved: (newValue) {
        email = newValue!;
      },
      validator: validateEmail,
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
      onSaved: (newValue) {
        password = newValue!;
      },
      validator: validatePassword,
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
        if (formKey.currentState?.validate() != null &&
            formKey.currentState?.validate() == true) {
          formKey.currentState?.save();
          print('email: $email\npass: $password');
        } else {
          print(formKey.currentState?.validate());
        }
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50),
      ),
      child: const Text('Submit'),
    );
  }
}
