import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../services/user_service.dart';

import 'register_screen.dart';
import 'student/student_dashboard.dart';
import 'teacher/teacher_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  bool isLoading = false;

  Future<void> loginUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      final credential = await _authService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final userDoc = await _userService.getUser(
        credential.user!.uid,
      );

      final data =
          userDoc.data() as Map<String, dynamic>;

      final role = data['role'];

      if (!mounted) return;

      if (role == 'student') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const StudentDashboard(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const TeacherDashboard(),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SmartEdu Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed:
                        isLoading ? null : loginUser,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text("Login"),
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Register",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}