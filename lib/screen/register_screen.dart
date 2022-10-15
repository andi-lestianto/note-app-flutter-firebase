import 'package:flutter/material.dart';
import 'package:note_app/services/firebase_auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();

  register() async {
    firebaseAuthServices
        .registerAccount(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(value!.user!.email.toString() + 'success register'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('register'),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'email',
                  hintText: 'masukkan email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'password',
                  hintText: 'masukkan password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  register();
                },
                child: Text('Register'),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Sudah punya akun? Logn disini'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
