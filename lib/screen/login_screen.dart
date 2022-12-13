import 'dart:convert';
import 'dart:io';

import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:note_app/screen/home_screen.dart';
import 'package:note_app/screen/register_screen.dart';
import 'package:note_app/services/firebase_auth_services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();

  login() async {
    firebaseAuthServices
        .loginAccount(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value!.user!.email.toString() + ' Login berhasil')));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
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
              Text('login'),
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
                  login();
                },
                child: Text('Login'),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => RegisterScreen(),
                    ),
                  );
                },
                child: Text('Belum punya akun? daftar disini'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
    final Directory output = await getTemporaryDirectory();
    final String screenshotFilePath = '${output.path}/feedback.png';
    final File screenshotFile = File(screenshotFilePath);
    await screenshotFile.writeAsBytes(feedbackScreenshot);
    return screenshotFilePath;
  }

  Future<void> createGitlabIssueFromFeedback(BuildContext context) async {
    BetterFeedback.of(context).show((feedback) async {
      const projectId = 'your-gitlab-project-id';
      const apiToken = 'your-gitlab-api-token';

      final screenshotFilePath = await writeImageToStorage(feedback.screenshot);

      // Upload screenshot
      final uploadRequest = http.MultipartRequest(
        'POST',
        Uri.https(
          'gitlab.com',
          '/api/v4/projects/$projectId/uploads',
        ),
      )
        ..files.add(await http.MultipartFile.fromPath(
          'file',
          screenshotFilePath,
        ))
        ..headers.putIfAbsent('PRIVATE-TOKEN', () => apiToken);
      final uploadResponse = await uploadRequest.send();

      final dynamic uploadResponseMap = jsonDecode(
        await uploadResponse.stream.bytesToString(),
      );

      // Create issue
      await http.post(
        Uri.https(
          'gitlab.com',
          '/api/v4/projects/$projectId/issues',
          <String, String>{
            'title': feedback.text.padRight(80),
            'description': '${feedback.text}\n'
                "${uploadResponseMap["markdown"] ?? "Missing image!"}",
          },
        ),
        headers: {
          'PRIVATE-TOKEN': apiToken,
        },
      );
    });
  }
}
