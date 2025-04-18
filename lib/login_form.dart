import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.length < 6) return 'Password too short';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const Key('email_field'),
                controller: _emailController,
                validator: emailValidator,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                key: const Key('password_field'),
                controller: _passwordController,
                validator: passwordValidator,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              ElevatedButton(
                key: const Key('submit_button'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("ok")));
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
